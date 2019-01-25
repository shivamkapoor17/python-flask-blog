from flask import Flask, flash, render_template, request, session, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime, date
from flask_mail import Mail, Message
from flask_migrate import Migrate
from werkzeug.utils import secure_filename
from math import ceil
import json
import os

with open("config.json", "r") as f:
    params = json.load(f)['params']

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = params['UPLOAD_FOLDER']

mail_settings = {
    "MAIL_SERVER": 'smtp.gmail.com',
    "MAIL_PORT": 465,
    "MAIL_USE_TLS": False,
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": os.environ['EMAIL'],
    "MAIL_PASSWORD": os.environ['PASS']
}
app.config.update(mail_settings)
mail = Mail(app)

app.secret_key = os.urandom(25)
app.config['SQLALCHEMY_DATABASE_URI'] = params['sqlalchemy_uri']

db = SQLAlchemy(app)
migrate = Migrate(app, db)

class Contact(db.Model):
    sno = db.Column(db.Integer, unique=False, primary_key=True)
    name = db.Column(db.String(10), unique=False, nullable=False)
    email = db.Column(db.String(80), unique=False, nullable=False)
    phone = db.Column(db.String(12), unique=False, nullable=False)
    message = db.Column(db.String(100), unique=False, nullable=True)
    date = db.Column(db.String(15))

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    subTitle = db.Column(db.String(200), nullable=True)
    description = db.Column(db.Text, nullable=False)
    date = db.Column(db.String(20))
    slug = db.Column(db.String(20))
    image_file = db.Column(db.String(20), nullable=False)



@app.route('/')
def index():
    posts = Posts.query.order_by(Posts.sno.desc()).all()
    last = ceil(len(posts) / params['no_of_post'])
    page = request.args.get('page')

    if not str(page).isnumeric():
        page = 1
    page = int(page)

    posts = posts[(page - 1)*params['no_of_post']:(page - 1)*params['no_of_post']+params['no_of_post']]

    if page == 1:
        prev = '#'
        next = "/?page="+str(page + 1)

    elif page == last:
        prev = "/?page="+str(page - 1)
        next = "#"

    else:
        prev = "/?page="+str(page - 1)
        next = "/?page="+str(page + 1)

    return render_template('index.html', posts=posts, prev=prev, next=next, params=params)

@app.route('/login', methods=['GET','POST'])
def login():
    if 'key' in session and session['key'] == params['admin_user']:
        return redirect(url_for('dashboard'))

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username == params['admin_user'] and password == params['admin_pass']:
            session['key'] = username
            return redirect(url_for('dashboard'))

    return render_template('login.html', params=params)

@app.route('/dashboard')
def dashboard():
    if 'key' in session and session['key'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', posts=posts, params=params)

    return redirect(url_for('login'))

@app.route('/delete/<string:sno>')
def delete(sno):
    if 'key' in session and session['key'] == params['admin_user']:
        post = Posts.query.get(sno)
        db.session.delete(post)
        db.session.commit()
        return redirect(url_for('dashboard'))
    return redirect(url_for('login'))

@app.route('/edit/<string:sno>', methods=['GET','POST'])
def edit(sno):
    if 'key' in session and session['key'] == params['admin_user']:
        if request.method == 'POST':
            title = request.form.get('Title')
            subTitle = request.form.get('SubTitle')
            description = request.form.get('Description')
            slug = request.form.get('Slug')
            image_file = request.form.get('Img_file')

            if sno == '0':
                data = Posts(title=title, subTitle=subTitle, description=description, date=date.today(), slug=slug, image_file=image_file)
                db.session.add(data)
                db.session.commit()
                return redirect(url_for('dashboard'))

            elif sno != '0':
                result = Posts.query.get(sno)
                result.title = title
                result.subTitle = subTitle
                result.description = description
                result.slug = slug
                result.image_file = image_file
                result.date = date.today()
                db.session.commit()
                return redirect(url_for('dashboard'))


        post = Posts.query.get(sno)
        return render_template('edit.html', post=post, sno=sno, params=params)
    return redirect(url_for('login'))

@app.route('/uploader', methods=['GET','POST'])
def uploader():
    if 'key' in session and session['key'] == params['admin_user']:
        if request.method == 'POST':
            file = request.files['file']
            if file:
                filename = secure_filename(file.filename)
                file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                return "<h1>file uploaded successfully<h1>"
    return redirect(url_for('login'))

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route('/logout')
def logout():
    if 'key' in session and session['key'] == params['admin_user']:
        session.pop('key', None)
    return redirect(url_for('login'))

@app.route('/contact', methods=['GET','POST'])
def contact():
    if request.method == 'POST':
        result = request.form
        if result['name']=='' or result['email']=='' or result['phone']=='' or result['message']=='':
            flash('please complete the entries!', 'error')

        else:
            data = Contact(name=result['name'], email=result['email'], phone=result['phone'],
                                   message=result['message'], date=datetime.now())
            db.session.add(data)
            db.session.commit()
            flash('form is successfully submitted')
            msg = Message(subject="NEW DATABASE ENTRY",
                          sender=app.config.get('MAIL_USERNAME'),
                          recipients=["shivam_kapoor17@ymail.com"])
            msg.body = f" NAME : {result['name']}, EMAIL : {result['email']}, PHONE : {result['phone']}, MESSAGE : {result['message']}"
            mail.send(msg)
    return render_template('contact.html', params=params)

@app.route('/post/<string:slug_post>')
def post_man(slug_post):
    post = Posts.query.filter_by(slug=slug_post).first()
    if post:
        return render_template('post.html', post=post, params=params)
    return "<h1> error url not found<h1>"

if __name__=="__main__":
    app.run(debug=True)
"""empty message

Revision ID: e57808a7fa43
Revises: 
Create Date: 2019-01-17 17:40:26.923591

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'e57808a7fa43'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('contact', 'message',
               existing_type=mysql.VARCHAR(length=100),
               nullable=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('contact', 'message',
               existing_type=mysql.VARCHAR(length=100),
               nullable=True)
    # ### end Alembic commands ###

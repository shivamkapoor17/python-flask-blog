-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2019 at 12:04 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kapoor`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` int(12) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, '', '', 0, '', '2019-01-06 15:0'),
(2, '', '', 0, '', '2019-01-06 15:0'),
(3, 'sk', '', 0, 'hi', '2019-01-06 15:0'),
(4, 'isha', 'ishakapoor@gmail.com', 0, 'fghj', '2019-01-06 16:1'),
(5, 'isha', 'ishakapoor@gmail.com', 0, 'fghj', '2019-01-06 16:1'),
(6, 'shivam kap', 'kapoor17kapoor@ymail.com', 0, 'hi', '2019-01-06 16:1'),
(7, 'shivam kap', 'shivam_kapoor17@ymail.com', 0, 'wddwd', '2019-01-06 16:3'),
(8, 'isha', 'ishakapoor@gmail.com', 0, 'gh', '2019-01-06 16:3'),
(9, 'isha', 'ishakapoor@gmail.com', 0, 'hiiiiiiiiiiiiiiiiiiiiiiiiiiii', '2019-01-06 16:3'),
(10, 'shivam kap', 'shivam_kapoor17@ymail.com', 0, 'Kapoor bhai', '2019-01-06 16:3'),
(11, 'shivam kapoor', 'shivam_kapoor17@ymail.com', 0, 'asdf', '2019-01-06 16:3'),
(12, 'shivam kapoor', 'shivam_kapoor17@ymail.com', 0, 'gf', '2019-01-06 16:3'),
(13, 'shubham', 'kapoor@gmail.com', 0, 'bhai', '2019-01-06 16:4'),
(14, 'shubham', 'kapoor@gmail.com', 0, 'df', '2019-01-06 16:4'),
(15, 'shivam', 'kapoor', 1429231020, 'hi', '2019-01-21 16:5'),
(16, 'shivam', 'kapoor', 1429231020, 'hi', '2019-01-21 16:5'),
(17, 'shivam lal', 'kapoor17kapoor@gmail.com', 2147483647, 'hggj', '2019-01-21 16:5'),
(18, 'shivam lal', 'kapoor17kapoor@gmail.com', 2147483647, 'vhhv', '2019-01-21 17:0'),
(19, 'shivam lal', 'kapoor17kapoor@gmail.com', 2147483647, 'vhhv', '2019-01-21 17:0'),
(20, 'shivam', 'kapoor', 1429231020, 'hi', '2019-01-21 17:0');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` varchar(20) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `subTitle` varchar(200) DEFAULT NULL,
  `image_file` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `description`, `date`, `slug`, `subTitle`, `image_file`) VALUES
(5, 'Python (programming language)', 'Python was conceived in the late 1980s[31] by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language (itself inspired by SETL)[32], capable of exception handling and interfacing with the Amoeba operating system.[7] Its implementation began in December 1989.[33] Van Rossum\'s long influence on Python is reflected in the title given to him by the Python community: Benevolent Dictator For Life (BDFL) – a post from which he gave himself permanen', '2019-01-21', 'forth-post', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python has a design philosophy that emphasizes code readability, n', 'python.jpg'),
(6, 'JavaScript', 'JavaScript\r\nParadigm	Multi-paradigm: event-driven,[1] functional, imperative, object-oriented (prototype-based)\r\nDesigned by	Brendan Eich\r\nDeveloper	Netscape Communications Corporation, Mozilla Foundation, Ecma International\r\nFirst appeared	December 4, 1995; 23 years ago[2]\r\nStable release	\r\nECMAScript 2018[3] / June 2018; 7 months ago\r\nPreview release	\r\nECMAScript 2019\r\nTyping discipline	Dynamic, duck\r\nFilename extensions	\r\n.js .mjs[4]\r\nWebsite	Mozilla\r\nMajor implementations\r\nV8, JavaScriptCo', '2019-01-21', 'fifth-post', 'Not to be confused with Java (programming language), Java (software platform), or Javanese script.', 'js2.png'),
(7, 'Django (web framework)', 'Django was created in the fall of 2003, when the web programmers at the Lawrence Journal-World newspaper, Adrian Holovaty and Simon Willison, began using Python to build applications. It was released publicly under a BSD license in July 2005. The framework was named after guitarist Django Reinhardt.[18]\r\n\r\nIn June 2008, it was announced that a newly formed Django Software Foundation (DSF) would maintain Django in the future', '2019-01-21', 'sixth-post', 'Django\'s primary goal is to ease the creation of complex, database-driven websites. The framework emphasizes reusability and \"pluggability\" of components, less code, low coupling, rapid development, a', 'django1.jpg'),
(8, 'Flask (web framework)', 'Werkzeug is a utility library for the Python programming language, in other words a toolkit for Web Server Gateway Interface (WSGI) applications, and is licensed under a BSD License. Werkzeug can realize software objects for request, response, and utility functions. It can be used to build a custom software framework on top of it and supports Python 2.6, 2.7 and 3.3.[14]\r\n', '2019-01-21', 'seventh-post', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.[3] It has no database abstraction layer, form validati', 'flask.png'),
(9, 'Jinja (template engine)', 'Jinja is a template engine for the Python programming language and is licensed under a BSD License created by Armin Ronacher. It is similar to the Django template engine but provides Python-like expressions while ensuring that the templates are evaluated in a sandbox. It is a text-based template language and thus can be used to generate any markup as well as sourcecode.', '2019-01-21', 'jinja-post', 'From Wikipedia, the free encyclopedia', 'jinja.png'),
(10, 'Databases in Flask', 'The nice thing about SQLAlchemy is that it is an ORM not for one, but for many relational databases. SQLAlchemy supports a long list of database engines, including the popular MySQL, PostgreSQL and SQLite. This is extremely powerful, because you can do your development using a simple SQLite database that does not require a server, and then when the time comes to deploy the application on a production server you can choose a more robust MySQL or PostgreSQL server, without having to change your ap', '2019-01-21', 'sqlalchemy-post', 'As I\'m sure you have heard already, Flask does not support databases natively.', 'sqlalchemy.jpg'),
(11, 'Flask-Login ', 'I decided that, at a minimum, I wanted bull to be able to display a “Sales Overview” page that contained basic sales data: transaction information, graphs of sales over time, etc. To do that (in a secure manner), I needed to add authentication and authorization to my little Flask app. Helpfully, though, I only needed to support a single, “admin” user who was authorized to view reports.', '2019-01-21', 'flask-login-post', 'Using Flask-Login for User Management with Flask', 'login1.jpg'),
(12, 'Flask wtforms', 'So far the application is very simple, and for that reason I did not need to worry about its configuration. But for any applications except the simplest ones, you are going to find that Flask (and possibly also the Flask extensions that you use) offer some amount of freedom in how to do things, and you need to make some decisions, which you pass to the framework as a list of configuration variables.', '2019-01-21', 'wtforms-post', 'To handle the web forms in this application I\'m going to use the Flask-WTF extension, which is a thin wrapper around the WTForms package that nicely integrates it with Flask', 'wtforms1.jpg'),
(13, 'Flask-Migrate', 'When you use Alembic alone you have to edit a couple of configuration files, but Flask-Migrate handles all that for you. When the init command completes you will have a migrations folder with the configuration files ready to be used.', '2019-01-21', 'migrate-post', 'Alembic database migration wrapper for Flask', 'migrate.png'),
(14, 'Bootstrap 4 Tutorial', 'Bootstrap 4 is the newest version of Bootstrap, which is the most popular HTML, CSS, and JavaScript framework for developing responsive, mobile-first websites.Bootstrap 4 is completely free to download and use!', '2019-01-21', 'bootstrap-post', 'Bootstrap 4 is the newest version of Bootstrap; with new components, faster stylesheet and more responsiveness.', 'bootstrap.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

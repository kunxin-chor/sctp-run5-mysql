
-- library
create database library;

use library;

 CREATE TABLE users (
     user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    first_name VARCHAR(255) NOT NULL,
     last_name VARCHAR(255) DEFAULT '',
     email VARCHAR(255),
     dob DATE
 ) engine = innodb;

 CREATE TABLE authors (
    author_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
 ) engine = innodb;

 CREATE TABLE publishers (
    publisher_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
 ) engine = innodb;

 CREATE TABLE address (
    address_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    street_name VARCHAR(255) NOT NULL,
    building_info VARCHAR(255) NOT NULL,
    postal_code VARCHAR(45) NOT NULL,
    unit_no VARCHAR(50) NOT NULL,
    floor_no VARCHAR(3) NOT NULL
 ) engine = innodb;

 ALTER TABLE address ADD COLUMN user_id INT UNSIGNED NOT NULL;

 ALTER TABLE address ADD CONSTRAINT fk_user_address
 FOREIGN KEY (user_id) REFERENCES users(user_id);

 CREATE TABLE books (
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    synopsis TEXT,
    isbn VARCHAR(13)
 ) engine = innodb;

 ALTER TABLE books ADD COLUMN publisher_id INT UNSIGNED;

 ALTER TABLE books ADD CONSTRAINT fk_book_publisher
 FOREIGN KEY(publisher_id) REFERENCES publishers(publisher_id);

 CREATE TABLE books_user (
    book_user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
 ) engine = innodb;

 ALTER TABLE books_user ADD COLUMN user_id INT UNSIGNED;

 ALTER TABLE books_user ADD CONSTRAINT fk_book_user
 FOREIGN KEY (user_id) REFERENCES users(user_id);

 ALTER TABLE books_user ADD COLUMN book_id INT UNSIGNED;
 ALTER TABLE books_user ADD CONSTRAINT fk_user_book
 FOREIGN KEY (book_id) REFERENCES books(book_id);

 CREATE TABLE writing_creidt (
    writing_credit_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
 ) engine = innodb;

  ALTER TABLE writing_creidt ADD COLUMN author_id INT UNSIGNED;

  ALTER TABLE writing_creidt ADD CONSTRAINT fk_author_writing_credit
  FOREIGN KEY (author_id) REFERENCES authors(author_id);

  ALTER TABLE writing_creidt ADD COLUMN book_id INT UNSIGNED;

  ALTER TABLE writing_creidt ADD CONSTRAINT fk_book_writing_credit
  FOREIGN KEY (book_id) REFERENCES books(book_id);

  ALTER TABLE writing_creidt
  RENAME TO writing_credit;
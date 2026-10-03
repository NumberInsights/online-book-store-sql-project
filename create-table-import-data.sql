CREATE DATABASE IF NOT EXISTS online_book_store;

USE online_book_store;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
book_id SERIAL PRIMARY KEY,
title varchar(100),
author varchar(100),
genre varchar(50),
published_year int,
price numeric(10,2),
stock int 
);

DROP TABLE IF EXISTS  customers;
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
    name varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(100),
    country varchar(100)
);

CREATE TABLE orders (
	order_id serial primary key,
    customer_id int references customers(customer_id),
    book_id int references books(book_id),
    order_date date,
    quantity int,
    total_amount numeric(10,2)
);

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;


-- import data through import data wizard

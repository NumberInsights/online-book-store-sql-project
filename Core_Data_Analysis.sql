-- Core Data Analysis
-- Q1 :  Retrieve all books in the "Fiction" genre
SELECT * FROM books WHERE genre= "Fiction";

-- Q2 : Find books published after the year 1950 
SELECT * FROM books WHERE published_year > 1950;

-- Q3 : List all customers from the Canada
SELECT * FROM customers WHERE country="Canada";

-- Q4 : Show orders placed in November 2023
SELECT * FROM orders WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- Q5 : Retrieve the total stock of books available
SELECT SUM(stock) AS total_stock FROM books;

-- Q6 :  Find the details of the most expensive book
SELECT * FROM books ORDER BY price DESC LIMIT 1;  

-- Q7 : Show all customers who ordered more than 1 quantity of a book
SELECT c.name, SUM(o.quantity) AS total_order
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id 
HAVING total_order>1 
ORDER BY total_order DESC;

-- Q8 : Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders WHERE total_amount > 20; 

-- Q9: List all genres available in the Books table
SELECT row_number() over() as NUMBER, genre 
FROM ( SELECT DISTINCT genre FROM books) AS unique_genre; 

-- Q10 : Find the book with the lowest stock
SELECT * FROM books ORDER BY stock LIMIT 1;

-- Q11 : Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS total_revenue FROM orders;



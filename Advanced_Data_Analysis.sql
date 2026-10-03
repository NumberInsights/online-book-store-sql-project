-- Advanced Data Analysis

-- Q1 : Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) AS total_books_sold  
FROM orders o 
JOIN books b 
ON o.book_id = b.book_id
GROUP BY b.genre;

-- Q2: Find the average price of books in the "Fantasy" genre
SELECT genre, AVG(price) AS average_price FROM books WHERE genre = "Fantasy";

-- Q3 :  List customers who have placed at least 2 orders
SELECT c.name, COUNT(o.order_id) AS total_order 
FROM orders o 
JOIN customers c 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.name 
HAVING total_order >= 2;

-- Q4 : Find the most frequently ordered book
SELECT o.book_id, b.title ,SUM(o.quantity) AS total_book_sold, 
COUNT(o.order_id) AS order_count  
FROM orders o 
JOIN books b 
ON b.book_id = o.book_id 
GROUP BY book_id 
ORDER BY total_book_sold DESC LIMIT 10;

-- Q5 : Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM books
WHERE genre = 'Fantasy' 
ORDER BY price DESC
LIMIT 3;

-- Q6 : Retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS total_quantity 
FROM orders o 
JOIN books b 
ON o.book_id = b.book_id 
GROUP BY b.author, b.book_id, b.title 
ORDER BY total_quantity DESC;

-- Q7 : List the cities where customers who spent over $30 are located
SELECT c.city, SUM(o.total_amount) AS total_spent 
FROM orders o 
JOIN customers c 
ON c.customer_id = o.customer_id 
GROUP BY c.city, o.customer_id 
HAVING total_spent > 30 
ORDER BY total_spent DESC;

-- Q8 : Find the customer who spent the most on orders
SELECT o.customer_id, c.name, SUM(total_amount) AS total_spent 
FROM orders o 
JOIN customers c 
ON o.customer_id = c.customer_id 
GROUP BY customer_id 
ORDER BY total_spent DESC
LIMIT 1;

-- Q9 - Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, coalesce(SUM(o.quantity),0) AS order_quantity, 
(b.stock - coalesce(SUM(o.quantity),0)) AS remaining_stock 
FROM books b 
LEFT JOIN orders o
ON o.book_id = b.book_id
GROUP BY b.book_id;


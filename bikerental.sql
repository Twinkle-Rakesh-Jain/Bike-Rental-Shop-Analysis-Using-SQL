-- Create database
CREATE DATABASE IF NOT EXISTS bike_rental;

-- Select the database to use
USE bike_rental;

-- Drop tables if they exist
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS membership;
DROP TABLE IF EXISTS membership_type;
DROP TABLE IF EXISTS bike;
DROP TABLE IF EXISTS customer;

-- Create customer table
CREATE TABLE customer
(
    id      INT PRIMARY KEY,
    name    VARCHAR(30),
    email   VARCHAR(50)
);

-- Create bike table
CREATE TABLE bike
(
    id              INT PRIMARY KEY,
    model           VARCHAR(50),
    category        VARCHAR(50),
    price_per_hour  DECIMAL(10, 2),
    price_per_day   DECIMAL(10, 2),
    status          VARCHAR(20)
);

-- Create rental table
CREATE TABLE rental
(
    id              INT PRIMARY KEY,
    customer_id     INT,
    bike_id         INT,
    start_timestamp TIMESTAMP,
    duration        INT,
    total_paid      DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (bike_id) REFERENCES bike(id)
);

-- Create membership_type table
CREATE TABLE membership_type
(
    id              INT PRIMARY KEY,
    name            VARCHAR(50),
    description     VARCHAR(500),
    price           DECIMAL(10, 2)
);

-- Create membership table
CREATE TABLE membership
(
    id                  INT PRIMARY KEY,
    membership_type_id  INT,
    customer_id         INT,
    start_date          DATE,
    end_date            DATE,
    total_paid          DECIMAL(10, 2),
    FOREIGN KEY (membership_type_id) REFERENCES membership_type(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Insert data into customer table
INSERT INTO customer VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Alice Smith', 'alice.smith@example.com'),
(3, 'Bob Johnson', 'bob.johnson@example.com'),
(4, 'Eva Brown', 'eva.brown@example.com'),
(5, 'Michael Lee', 'michael.lee@example.com'),
(6, 'Sarah White', 'sarah.white@example.com'),
(7, 'David Wilson', 'david.wilson@example.com'),
(8, 'Emily Davis', 'emily.davis@example.com'),
(9, 'Daniel Miller', 'daniel.miller@example.com'),
(10, 'Olivia Taylor', 'olivia.taylor@example.com');

-- Insert data into bike table
INSERT INTO bike Values
(1, 'Mountain Bike 1', 'mountain bike', 10.00, 50.00, 'available'),
(2, 'Road Bike 1', 'road bike', 12.00, 60.00, 'available'),
(3, 'Hybrid Bike 1', 'hybrid', 8.00, 40.00, 'rented'),
(4, 'Electric Bike 1', 'electric', 15.00, 75.00, 'available'),
(5, 'Mountain Bike 2', 'mountain bike', 10.00, 50.00, 'out of service'),
(6, 'Road Bike 2', 'road bike', 12.00, 60.00, 'available'),
(7, 'Hybrid Bike 2', 'hybrid', 8.00, 40.00, 'out of service'),
(8, 'Electric Bike 2', 'electric', 15.00, 75.00, 'available'),
(9, 'Mountain Bike 3', 'mountain bike', 10.00, 50.00, 'rented'),
(10, 'Road Bike 3', 'road bike', 12.00, 60.00, 'available');

-- Insert data into rental table
INSERT INTO rental VALUES
(1, 1, 1, '2022-11-01 10:00:00', 240, 50.00),
(2, 1, 1, '2022-11-02 10:00:00', 245, 50.00),
(3, 1, 1, '2022-11-03 10:00:00', 250, 50.00),
(4, 1, 1, '2022-11-04 10:00:00', 235, 50.00),
(5, 1, 1, '2022-12-05 10:00:00', 155, 50.00),
(6, 2, 2, '2022-12-08 11:00:00', 250, 60.00),
(7, 3, 3, '2022-12-13 12:00:00', 245, 40.00),
(8, 1, 1, '2023-01-05 10:00:00', 240, 50.00),
(9, 2, 2, '2023-01-08 11:00:00', 235, 60.00),
(10, 3, 3, '2023-02-13 12:00:00', 245, 40.00),
(11, 1, 1, '2023-03-05 10:00:00', 250, 50.00),
(12, 2, 2, '2023-03-08 11:00:00', 355, 60.00),
(13, 3, 3, '2023-04-13 12:00:00', 240, 40.00),
(14, 1, 1, '2023-04-01 10:00:00', 235, 50.00),
(15, 1, 6, '2023-05-01 10:00:00', 245, 60.00),
(16, 1, 2, '2023-05-01 10:00:00', 250, 60.00),
(17, 1, 3, '2023-06-01 10:00:00', 235, 40.00),
(18, 1, 4, '2023-06-01 10:00:00', 255, 75.00),
(19, 1, 5, '2023-07-01 10:00:00', 240, 50.00),
(20, 2, 2, '2023-07-02 11:00:00', 445, 60.00),
(21, 3, 3, '2023-07-03 12:00:00', 250, 40.00),
(22, 4, 4, '2023-08-04 13:00:00', 235, 75.00),
(23, 5, 5, '2023-08-05 14:00:00', 555, 50.00),
(24, 6, 6, '2023-09-06 15:00:00', 240, 60.00),
(25, 7, 7, '2023-09-07 16:00:00', 245, 40.00),
(26, 8, 8, '2023-09-08 17:00:00', 250, 75.00),
(27, 9, 9, '2023-10-09 18:00:00', 335, 50.00),
(28, 10, 10, '2023-10-10 19:00:00', 255, 60.00),
(29, 10, 1, '2023-10-10 19:00:00', 240, 50.00),
(30, 10, 2, '2023-10-10 19:00:00', 245, 60.00),
(31, 10, 3, '2023-10-10 19:00:00', 250, 40.00),
(32, 10, 4, '2023-10-10 19:00:00', 235, 75.00);

-- Insert data into membership_type table
INSERT INTO membership_type VALUES
(1, 'Basic Monthly', 'Unlimited rides with non-electric bikes. Renews monthly.', 100.00),
(2, 'Basic Annual', 'Unlimited rides with non-electric bikes. Renews annually.', 500.00),
(3, 'Premium Monthly', 'Unlimited rides with all bikes. Renews monthly.', 200.00);

-- Insert data into membership table
INSERT INTO membership VALUES
(1, 2, 3, '2023-08-01', '2023-08-31', 500.00),
(2, 1, 2, '2023-08-01', '2023-08-31', 100.00),
(3, 3, 4, '2023-08-01', '2023-08-31', 200.00),
(4, 1, 1, '2023-09-01', '2023-09-30', 100.00),
(5, 2, 2, '2023-09-01', '2023-09-30', 500.00),
(6, 3, 3, '2023-09-01', '2023-09-30', 200.00),
(7, 1, 4, '2023-10-01', '2023-10-31', 100.00),
(8, 2, 5, '2023-10-01', '2023-10-31', 500.00),
(9, 3, 3, '2023-10-01', '2023-10-31', 200.00),
(10, 3, 1, '2023-11-01', '2023-11-30', 200.00),
(11, 2, 5, '2023-11-01', '2023-11-30', 500.00),
(12, 1, 2, '2023-11-01', '2023-11-30', 100.00);

-- Query the data from the tables
SELECT * FROM customer;
SELECT * FROM bike;
SELECT * FROM rental;
SELECT * FROM membership_type;
SELECT * FROM membership;

-- 1. Total number of bikes the shop owns by category. Show only the categories where the number of bikes is greater than 2 .
SELECT category, COUNT(id) AS number_of_bikes
FROM bike
GROUP BY category
HAVING COUNT(id) > 2;

-- 2. Display a list of customer names with the total number of memberships purchased by each (call this coloumn membership_count) and sort
-- the results by membership_count , starting with the customer who has purchased the highest number of memberships.
SELECT c.name, COUNT(m.id) AS membership_count
FROM customer c 
LEFT JOIN membership m
ON c.id = m.customer_id
GROUP BY c.name
ORDER BY membership_count DESC;

-- 3. Special offer for winter months. For each bike, display its ID, category, old price per hour (call this column old_price_per_hour ), discounted price per hour (call it new_price_per_hour ), old
-- price per day (call it old_price_per_day ), and discounted price per day (call it new_price_per_day ).
SELECT 
    id,
    category,
    price_per_hour AS old_price_per_hour,
    ROUND(CASE 
        WHEN category = 'Electric' THEN price_per_hour * 0.90
        WHEN category = 'Mountain' THEN price_per_hour * 0.80
        ELSE price_per_hour * 0.50
    END, 2) AS new_price_per_hour,
    price_per_day AS old_price_per_day,
    ROUND(CASE 
        WHEN category = 'Electric' THEN price_per_day * 0.80
        WHEN category = 'Mountain' THEN price_per_day * 0.50
        ELSE price_per_day * 0.50
    END, 2) AS new_price_per_day
FROM bike;

-- 4. Display the counts of the rented bikes and of the available bikes in each category.
SELECT 	category,
        COUNT(CASE WHEN  status = 'rented' THEN 1 END) AS rented_bikes_count,
        COUNT(CASE WHEN status = 'available' THEN 1 END) AS available_bikes_count
FROM bike
GROUP BY category;

-- 5. Display the total revenue from rentals for each month, the total for each year, and the total across all the years. Do not take memberships into account. There should be 3 columns: year , month , and revenue .
-- Sort the results chronologically. Display the year total after all the month totals for the corresponding year. Show the all-time total as the last row.
SELECT YEAR(start_timestamp) AS year, MONTH(start_timestamp) AS month, SUM(total_paid) AS revenue
FROM rental
GROUP BY YEAR(start_timestamp), MONTH(start_timestamp)
UNION ALL
SELECT YEAR(start_timestamp) AS year, NULL  AS month, SUM(total_paid) AS revenue
FROM rental
GROUP BY YEAR(start_timestamp)
UNION ALL
SELECT NULL AS year, NULL  AS month, SUM(total_paid) AS revenue
FROM rental;

-- 6. Display the year, the month, the name of the membership type (call this column membership_type_name ), and the total revenue (call this column
-- total_revenue ) for every combination of year, month, and membership type. Sort the results by year, month, and name of membership type.
SELECT  YEAR(m1.start_date) AS year, MONTH(m1.start_date) AS month, m2.name AS membership_type_name, SUM(m1.total_paid) AS revenue
FROM membership m1
JOIN membership_type m2
ON m1.membership_type_id = m2.id
GROUP BY YEAR(m1.start_date), MONTH(m1.start_date), m2.name
ORDER BY year, month, membership_type_name;

-- 7. Display the total revenue from memberships purchased in 2023 for each combination of month and membership type. Generate subtotals and grand totals for all possible combinations. There should be 3 columns:
-- membership_type_name , month , and total_revenue .

/* 8. Categorize customers based on their rental history as follows:
Customers who have had more than 10 rentals are categorized as 'more
than 10' .
Customers who have had 5 to 10 rentals (inclusive) are categorized as
'between 5 and 10' .
Customers who have had fewer than 5 rentals should be categorized as
'fewer than 5' .
Calculate the number of customers in each category. Display two columns: rental_count_category (the rental count category) and customer_count (the
number of customers in each category). */
WITH cte AS (
    SELECT 
        customer_id, 
        COUNT(*) AS rental_count, 
        CASE 
            WHEN COUNT(*) > 10 THEN 'more than 10' 
            WHEN COUNT(*) BETWEEN 5 AND 10 THEN 'between 5 and 10'
            ELSE 'fewer than 5'
        END AS category
    FROM rental
    GROUP BY customer_id
)
SELECT 
    category AS rental_count_category, 
    COUNT(*) AS customer_count
FROM 
    cte
GROUP BY 
    category
ORDER BY 
    customer_count;

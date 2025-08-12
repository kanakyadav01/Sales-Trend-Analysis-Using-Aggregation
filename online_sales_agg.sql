-- Create database
CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- Create table
DROP TABLE IF EXISTS online_sales;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);

-- Insert data: 100+ rows for 2023
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1,  '2023-01-02', 120.50, 101),
(2,  '2023-01-04', 150.00, 102),
(3,  '2023-01-15', 200.00, 103),
(4,  '2023-01-21', 90.00, 104),
(5,  '2023-01-28', 250.00, 105),
(6,  '2023-02-03', 300.00, 106),
(7,  '2023-02-07', 180.00, 107),
(8,  '2023-02-14', 220.00, 108),
(9,  '2023-02-20', 145.00, 109),
(10, '2023-02-25', 175.00, 110),
(11, '2023-03-01', 250.00, 101),
(12, '2023-03-05', 300.00, 102),
(13, '2023-03-10', 400.00, 103),
(14, '2023-03-15', 350.00, 104),
(15, '2023-03-21', 275.00, 105),
(16, '2023-03-28', 150.00, 106),
(17, '2023-04-02', 310.00, 107),
(18, '2023-04-08', 280.00, 108),
(19, '2023-04-14', 190.00, 109),
(20, '2023-04-18', 420.00, 110),
(21, '2023-04-25', 380.00, 101),
(22, '2023-05-03', 250.00, 102),
(23, '2023-05-06', 330.00, 103),
(24, '2023-05-12', 410.00, 104),
(25, '2023-05-19', 500.00, 105),
(26, '2023-05-22', 175.00, 106),
(27, '2023-05-28', 280.00, 107),
(28, '2023-06-01', 150.00, 108),
(29, '2023-06-07', 220.00, 109),
(30, '2023-06-15', 275.00, 110),
(31, '2023-06-19', 190.00, 101),
(32, '2023-06-24', 350.00, 102),
(33, '2023-07-02', 500.00, 103),
(34, '2023-07-05', 300.00, 104),
(35, '2023-07-09', 420.00, 105),
(36, '2023-07-14', 180.00, 106),
(37, '2023-07-21', 250.00, 107),
(38, '2023-07-25', 310.00, 108),
(39, '2023-07-29', 275.00, 109),
(40, '2023-08-03', 190.00, 110),
(41, '2023-08-07', 220.00, 101),
(42, '2023-08-12', 300.00, 102),
(43, '2023-08-16', 350.00, 103),
(44, '2023-08-20', 500.00, 104),
(45, '2023-08-25', 175.00, 105),
(46, '2023-08-30', 280.00, 106),
(47, '2023-09-02', 150.00, 107),
(48, '2023-09-05', 220.00, 108),
(49, '2023-09-10', 275.00, 109),
(50, '2023-09-14', 350.00, 110),
(51, '2023-09-18', 500.00, 101),
(52, '2023-09-23', 420.00, 102),
(53, '2023-10-01', 180.00, 103),
(54, '2023-10-05', 300.00, 104),
(55, '2023-10-10', 250.00, 105),
(56, '2023-10-14', 275.00, 106),
(57, '2023-10-18', 190.00, 107),
(58, '2023-10-22', 350.00, 108),
(59, '2023-10-26', 275.00, 109),
(60, '2023-10-30', 420.00, 110),
(61, '2023-11-02', 500.00, 101),
(62, '2023-11-06', 300.00, 102),
(63, '2023-11-09', 420.00, 103),
(64, '2023-11-13', 250.00, 104),
(65, '2023-11-17', 175.00, 105),
(66, '2023-11-21', 280.00, 106),
(67, '2023-11-25', 150.00, 107),
(68, '2023-11-28', 220.00, 108),
(69, '2023-12-01', 300.00, 109),
(70, '2023-12-04', 350.00, 110),
(71, '2023-12-08', 500.00, 101),
(72, '2023-12-12', 420.00, 102),
(73, '2023-12-16', 275.00, 103),
(74, '2023-12-20', 250.00, 104),
(75, '2023-12-24', 190.00, 105),
(76, '2023-12-28', 350.00, 106);

-- Query for monthly sales trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE YEAR(order_date) = 2024
GROUP BY order_year, order_month
ORDER BY order_month;

SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY total_revenue DESC
LIMIT 5;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 1;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) / COUNT(DISTINCT order_id) AS avg_order_value
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT 
    product_id,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC;

SELECT 
    year,
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY year, month) AS prev_month_revenue,
    ROUND(((total_revenue - LAG(total_revenue) OVER (ORDER BY year, month)) 
           / LAG(total_revenue) OVER (ORDER BY year, month)) * 100, 2) AS growth_percentage
FROM (
    SELECT 
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(amount) AS total_revenue
    FROM online_sales
    GROUP BY year, month
) AS monthly_data;

SELECT year, month, product_id, total_revenue
FROM (
    SELECT 
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        product_id,
        SUM(amount) AS total_revenue,
        RANK() OVER (PARTITION BY YEAR(order_date), MONTH(order_date) ORDER BY SUM(amount) DESC) AS rank_in_month
    FROM online_sales
    GROUP BY year, month, product_id
) ranked
WHERE rank_in_month <= 3
ORDER BY year, month, rank_in_month;




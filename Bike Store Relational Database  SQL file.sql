1. Top Selling Products - Identify the top 5 best-selling products based on the total quantity sold. 

SELECT P.product_name, SUM(OI.quantity) AS total_sold 
FROM order_items OI 
JOIN products P 
ON OI.product_id = P.product_id 
GROUP BY 1 
ORDER BY 2 DESC 
LIMIT 5 


2.Sales by Year - Calculate total sales for each year. 

SELECT YEAR(O.order_date) AS year, ROUND(SUM(OI.quantity * OI.list_price * (1-OI.discount)),2) AS total_sales 
FROM orders O 
JOIN order_items OI  
ON O.order_id = OI.order_id 
GROUP BY YEAR(O.order_date) 
ORDER BY year DESC


3.Staff Performance Based on Product Categories Sold: 
Assessing staff performance by evaluating the sales of different product 
categories.

select S.staff_id, S.first_name, S.last_name, C.category_name, round(sum(I.quantity*I.list_price*(1-I.discount)),2) as Sales 
from orders O 
join staffs S 
on O.staff_id = S.staff_id 
join order_items I 
on O.order_id = I.order_id 
join products P 
on I.product_id = P.product_id 
join categories C 
on P.category_id = C.category_id 
group by 1,2,3,4 
order by 5 desc 
limit 10 


4. Average Discount Given by Product Category - Calculating the average discount given for different product categories. 

select C.category_name, round(avg(I.discount*100),3) as Average_discount_by_Product_Category 
from products P 
join categories C 
on P.category_id = C.category_id 
join order_items I 
on P.product_id = I.product_id 
group by 1 
order by 2 desc;


5.Best-Selling Brands - Identify which brands have the highest sales. 

SELECT B.brand_name, ROUND(SUM(OI.quantity * OI.list_price * (1-OI.discount)),2) AS total_sales 
FROM order_items OI 
JOIN products P  
ON oi.product_id = P.product_id 
JOIN brands B  
ON P.brand_id = B.brand_id 
GROUP BY 1 
ORDER BY 2 DESC; 


6.Orders by Customer Region - Analyze orders by customers state to determine the most active regions. 

SELECT C.state, COUNT(O.order_id) AS order_count 
FROM customers C 
JOIN orders O  
ON C.customer_id = O.customer_id 
GROUP BY 1 
ORDER BY 2 DESC;   


7.Total Sales per Store - Calculate the total sales for each store 

SELECT S.store_name, ROUND(SUM(OI.quantity * OI.list_price * (1-OI.discount)),2) AS total_sales 
FROM orders O 
JOIN stores S  
ON O.store_id = S.store_id 
JOIN order_items OI 
ON O.order_id = OI.order_id 
GROUP BY 1 
ORDER BY 2 DESC;   


8.Customer with Most Orders - Find the customer who has placed the most orders. 

SELECT C.first_name, C.last_name, COUNT(O.order_id) AS order_count 
FROM customers C 
JOIN orders O 
ON C.customer_id = O.customer_id 
GROUP BY C.customer_id, 1, 2 
ORDER BY 3 DESC 
LIMIT 1; 


9.Average Order Value by Store - Calculate the average order value for each store.  

SELECT S.store_name, ROUND(AVG(OI.quantity * OI.list_price),2) AS avg_order_value 
FROM orders O 
JOIN stores S 
ON O.store_id = S.store_id 
JOIN order_items OI  
ON O.order_id = OI.order_id 
GROUP BY 1 
ORDER BY 2 DESC; 


10.Most Common Product Pairs Purchased Together - Identify the most common pairs of products that are purchased together in 
the same order.  

SELECT p1.product_name AS product_1, p2.product_name AS product_2, COUNT(*) AS times_bought_together 
FROM order_items oi1 
JOIN order_items oi2  
ON oi1.order_id = oi2.order_id AND oi1.product_id < oi2.product_id 
JOIN products p1  
ON oi1.product_id = p1.product_id 
JOIN products p2 ON oi2.product_id = p2.product_id 
GROUP BY 1, 2 
ORDER BY 3 DESC 
LIMIT 5; 



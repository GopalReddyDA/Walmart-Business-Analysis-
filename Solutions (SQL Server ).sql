

select * from walmart_dataset

-- Basic Data Exploratition 

SELECT 
	COUNT(*)AS totalrecords
FROM walmart_dataset 

SELECT DISTINCT payment_method AS unique_payments
FROM walmart_dataset 


select count(distinct Branch)as unique_branchs 
from walmart_dataset


select 
	category,round(sum(total_amount),2)as total_amount 
from walmart_dataset 
group by category
order by total_amount desc 


-- Finding Business Insights 

--Q 1. Calculate the total sales revenue from all transactions.
select 
	sum(total_amount)as amount
from walmart_dataset 

-- Q2 Which city generated the highest total sales? 
select top 1 
	city , 
	sum(total_amount)as total_amount 
from walmart_dataset
group by city 
order by total_amount desc 

--Q3. Which branch recorded the highest amount ?
select top 1 
	Branch,
	sum(total_amount)as amount 
from walmart_dataset
group by branch
order by amount desc 

-- Q4 Which product category generated the highest sales revenue?
select 
	category,
	round(sum(total_amount),2)as category_wise_amount
from walmart_dataset
group by category 
order by category desc 

--Q5 .Which payment method was used most frequently by customers? 
-- ans : Credit card 
select 
	payment_method,count(*)as payment_most_used_frequently
from walmart_dataset
group by payment_method
order by payment_most_used_frequently desc 
-- ans : Credit card 


--Q6. Find the average customer rating for each product category ?
select 
	category, avg(rating)as category_wise_avg_rating 
from walmart_dataset
group by category ;


-- Question 7: What are the different payment methods, and how many transactions and items were sold with each method?

Select 
	payment_method,
	count(*)as no_payments,
	sum(quantity)as total_sold_quantity
from walmart_dataset
group by payment_method 
;
--Question 8: Which category received the highest average rating in each branch?

with cte as (
select 
	Branch,
	category,
	round(avg(rating),2)as avg_ratings
from walmart_dataset
group by Branch,
		category
)

,cte2 as (
select 
	Branch,
	category,
	avg_ratings
	,rank()over(partition by branch order by avg_ratings desc )as rn_desc 
from cte )

select 
	Branch,
	category,
	avg_ratings
from cte2 
where rn_desc =1 
;

-- Question 9: What is the busyest day of the week for each branch based on transaction volume?
with cte as (
select 
	Branch,
	datename(WEEKDAY,date)as days,
	count(*)as no_of_transactions 
from walmart_dataset
group by Branch ,	datename(WEEKDAY,date)
)

,cte2 as (
select 
	*,rank()over(partition by branch order by no_of_transactions desc )as rn_desc
from cte )

select 
	Branch,
	days,
	no_of_transactions
from cte2 where rn_desc =1 

-- Question 10: How many items were sold through each payment method?

select 
	payment_method,
	sum(quantity)as sold_quantity
from walmart_dataset
group by payment_method
order by sold_quantity desc  ;

-- Question 11 : What are the average, minimum, and maximum ratings for each category in each city?

select 
	city,
	category,
	round(min(rating),2)as min_rating,
	round(max(rating),2)as max_rating,
	round(avg(rating),2)as avg_rating 
from walmart_dataset
group by city , category

--  Question 12 : What is the total profit for each category, ranked from highest to lowest?
select 
	category,
	round(sum(total_amount),2)as total_amount
from walmart_dataset
group by category
order by total_amount desc 


--  Question 13 : What is the most frequently used payment method in each branch ?
with cte as (
select 
	Branch,
	payment_method,
	count(*)as no_payments_by_branch
from walmart_dataset
group by Branch, payment_method
)
,cte2 as (
select 
	*,
	rank()over(partition by branch order by no_payments_by_branch desc )as rn_desc 
from cte )

select 
	Branch,
	payment_method,
	no_payments_by_branch
from cte2 where rn_desc =1 

select * from walmart_dataset
-- Question 14: How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?

SELECT
    Branch,
    CASE
        WHEN DATEPART(HOUR, Time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, Time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(*) AS TransactionCount
FROM walmart_dataset
GROUP BY
    Branch,
    CASE
        WHEN DATEPART(HOUR, Time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, Time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY
    Branch,
    Shift;

--  Question 15: Which branches experienced the largest decrease in revenue compared to the previous year
WITH year_wise_revenue AS (
    SELECT
        Branch,
        YEAR([Date]) AS Year,
        SUM(Total_Amount) AS Revenue
    FROM walmart_dataset
    GROUP BY Branch, YEAR([Date])
),
revenue_comparison AS (
    SELECT
        Branch,
        Year,
        Revenue,
        LAG(Revenue, 1) OVER (
            PARTITION BY Branch
            ORDER BY Year
        ) AS Previous_Year_Revenue
    FROM year_wise_revenue
)
SELECT
    Branch,
    Year,
    Previous_Year_Revenue,
    Revenue AS Current_Year_Revenue,
    round(Revenue - Previous_Year_Revenue,2) AS Revenue_Change
FROM revenue_comparison
WHERE Previous_Year_Revenue IS NOT NULL
ORDER BY Revenue_Change;
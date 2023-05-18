[2356. Number of Unique Subjects Taught by Each Teacher](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&id=top-sql-50)
```sql
# Write your MySQL query statement below
select teacher_id , count(distinct subject_id) as cnt from Teacher group by teacher_id
```

[1141. User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&id=top-sql-50)
```sql
Select activity_date as day , count(distinct user_id) as active_users from Activity 
where activity_date between '2019-06-28 'and '2019-07-27'
group by activity_date
```
[1070. Product Sales Analysis III](https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&id=top-sql-50)

```sql
# Approach 1
with cte as 
(select *, RANK() over(partition by product_id order by year) as rnk 
from sales)
select product_id, year as first_year, quantity,price 
from cte where rnk = 1

```

```sql
# Approach 2
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
SELECT product_id, MIN(year) as year
FROM Sales
GROUP BY product_id) ;
```

[596. Classes More Than 5 Students](https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&id=top-sql-50)

```sql
select class from Courses 
group by class 
having count(class) >= 5
```

[1729. Find Followers Count](https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&id=top-sql-50)

```sql
select user_id, count(follower_id) as followers_count from Followers 
group by user_id
order by user_id asc;
```

[619. Biggest Single Number](https://leetcode.com/problems/biggest-single-number/?envType=study-plan-v2&id=top-sql-50)
```sql
SELECT IF(COUNT(num) = 1, num, null) AS num FROM MyNumbers
GROUP BY num
ORDER BY num DESC LIMIT 1;
```

[1045. Customers Who Bought All Products](https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&id=top-sql-50)

```sql
# Approach 1 
WITH product_list AS (
SELECT GROUP_CONCAT(product_key ORDER BY product_key) AS all_products
FROM Product
)
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING GROUP_CONCAT(DISTINCT product_key ORDER BY product_key) = (SELECT all_products FROM product_list);

```
```sql

#Approach 2
select customer_id
from customer c
group by customer_id
having count(distinct product_key)=(select count(distinct product_key) from product)
```

[610.Triangle Judgement](https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&id=top-sql-50)

```SQL
select * , case when x + y > z and x + z > y and y + z > x then 'Yes' else 'No' end as triangle from Triangle

```
[180.Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&id=top-sql-50)

```sql
Step 1 : 

SELECT num,LAG(num) OVER () AS PrevNum, LEAD(num) OVER (ORDER BY id) AS NextNum from Logs

output:

| num | PrevNum | NextNum |
| --- | ------- | ------- |
| 1   | null    | 1       |
| 1   | 1       | 1       |
| 1   | 1       | 2       |
| 2   | 1       | 1       |
| 1   | 2       | 2       |
| 2   | 1       | 2       |
| 2   | 2       | null    |

```
```sql

Step 2:

#Make the above as a sub query and retrive the num from that by writing the where condition:

Solution: 
select distinct num as ConsecutiveNums 
(SELECT num,LAG(num) OVER () AS PrevNum, LEAD(num) OVER (ORDER BY id) AS NextNum from Logs) l 
where num = PrevNum and num = NextNum

```
```sql
#Approach 2

with cte as 
(select *,LEAD(num,1) over() as next_1,
LEAD(num,2) OVER() AS next_2 from logs)

select distinct num as  ConsecutiveNums from cte
where num = next_1 and num = next_2
```

[1204. Last Person to Fit in the Bus](https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&id=top-sql-50)

```SQL
#Solution:
with cte AS
(
select *, sum(weight) over(order by turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as total
from queue)

SELECT person_name from cte where total<=1000
order by total desc
limit 1
```

[1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories/?envType=study-plan-v2&id=top-sql-50)

```sql
SELECT "Low Salary" AS Category,
SUM(CASE WHEN income<20000 THEN 1 ELSE 0 end) AS accounts_count
FROM Accounts
UNION
SELECT  "Average Salary" Category,
SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
UNION
SELECT "High Salary" category,
SUM(CASE WHEN income>50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
```

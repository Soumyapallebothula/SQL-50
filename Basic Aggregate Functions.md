[Not Boring Movies](https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&id=top-sql-50)

 ```SQL
select * from Cinema where mod(id,2)<>0 AND description <> 'boring'
order by rating desc;
```

[Average Selling Price](https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&id=top-sql-50)

```SQL
Select product_id , ROUND(sum(units*price) / sum(units),2) as average_price from Prices p left join UnitsSold s using(product_id) 
where purchase_date between start_date and end_date
group by product_id 

```
[ Project Employees I](https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&id=top-sql-50)

```sql
SELECT project_id , round(avg(experience_years),2)  as average_years from Project p left join Employee e using (employee_id) 
group by project_id

```

[1633. Percentage of Users Attended a Contest](https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&id=top-sql-50)
```sql
#Using CTEs
WITH user_count as (
    SELECT COUNT(*) as total_users
    FROM Users
    )

SELECT contest_id, 
       ROUND(COUNT(user_id) / total_users * 100, 2) as "percentage"
FROM Register
JOIN user_count
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;


```
```sql
#Using group by
select contest_id , round(count(user_id)/ (select count(user_id) from Users) * 100,2) as percentage from users u join register r using(user_id)
group by contest_id
order by percentage desc,contest_id asc;
```

[1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&id=top-sql-50)

```sql
SELECT 
	query_name,
	ROUND(AVG(rating / position), 2) AS quality,
	ROUND(AVG(rating < 3) * 100, 2) AS poor_query_percentage 
FROM 
	Queries
GROUP BY 
	query_name
```


[1193. Monthly Transactions I](https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&id=top-sql-50)

```sql
select  DATE_FORMAT(trans_date, '%Y-%m') as  month , country , count(amount) as  trans_count,
sum(case when state = 'approved' then 1 else 0 end) approved_count,
sum(case when state = 'approved' then amount else 0 end) approved_total_amount,
sum(amount) as trans_total_amount
from transactions 
group by country ,DATE_FORMAT(trans_date, '%Y-%m')
```

[1174. Immediate Food Delivery II](https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&id=top-sql-50)

```sql

# Write your MySQL query statement below
select ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 else 0 end) / count(customer_id) * 100 , 2)  as immediate_percentage from Delivery
WHERE (customer_id, order_date) IN
(SELECT customer_id, min(order_date) as min_date FROM Delivery
GROUP BY customer_id
);

```

[550. Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&id=top-sql-50)

```sql
# Write your MySQL query statement below

with cte as 
(select distinct player_id , min(event_date) as first_login  from Activity group by player_id)

select 
ROUND(Count(DISTINCT a.player_id)/(select count(distinct player_id) from Activity) , 2) as fraction
from Activity a join cte c on a.player_id = c.player_id and a.event_date <> c.first_login
where datediff(a.event_date ,c.first_login ) = 1


```

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

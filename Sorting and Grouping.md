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



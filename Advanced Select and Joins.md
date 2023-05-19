[1731. The Number of Employees Which Report to Each Employee](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&id=top-sql-50)

```sql
select mgr.employee_id, mgr.name, COUNT(emp.employee_id) as reports_count, ROUND(AVG(emp.age)) as average_age
from employees emp join employees mgr
on emp.reports_to = mgr.employee_id
group by employee_id
order by employee_id
```

[1789. Primary Department for Each Employee](https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&id=top-sql-50)
```sql
#Approach 1

Select employee_id, 
case when count(department_id) = 1 then department_id
when count(department_id)>1 then SUM((primary_flag = 'Y')*department_id) END AS department_id
from Employee
group by employee_id
```

```sql
#Approach 2
SELECT employee_id, 
  CASE 
    WHEN COUNT(department_id) = 1 THEN department_id
    WHEN COUNT(department_id) > 1 THEN (SELECT department_id FROM Employee WHERE primary_flag = 'Y' AND employee_id = e.employee_id )
  END AS department_id
FROM Employee e
GROUP BY employee_id;
```

```sql 

#Approach 3
(SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y')
UNION
(SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1)
```
```sql

#Approach 4

SELECT employee_id, 
  CASE 
    WHEN COUNT(department_id) = 1 THEN MAX(department_id)
    WHEN COUNT(department_id) > 1 THEN MAX(CASE WHEN primary_flag = 'Y' THEN department_id END)
  END AS department_id
FROM Employee
GROUP BY employee_id;

```

[610. Triangle Judgement](https://leetcode.com/problems/triangle-judgement/?envType=study-plan-v2&id=top-sql-50)
```sql

select * , case when x + y > z and x + z > y and y + z > x then 'Yes' else 'No' end as triangle from Triangle

```
[180. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&id=top-sql-50)

```sql
with cte as 
(select *,LEAD(num,1) over() as next_1,
LEAD(num,2) OVER() AS next_2 from logs)

select distinct num as  ConsecutiveNums from cte
where num = next_1 and num = next_2
```

[1164. Product Price at a Given Date](https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&id=top-sql-50)

```sql
SELECT distinct a.product_id,ifnull(temp.new_price,10) as price 
FROM products as a
LEFT JOIN
(SELECT * 
FROM products 
WHERE (product_id, change_date) in (select product_id,max(change_date) from products where change_date<="2019-08-16" group by product_id)) as temp
on a.product_id = temp.product_id;
```

[1204. Last Person to Fit in the Bus](https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&id=top-sql-50)

```sql
with cte AS
(select *, sum(weight) over(order by turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as total from queue)
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






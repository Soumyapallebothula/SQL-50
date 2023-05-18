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

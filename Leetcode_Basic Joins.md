QNS LINKS:

1.[1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/?envType=study-plan-v2&id=top-sql-50)

2.[1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/?envType=study-plan-v2&id=top-sql-50)

3.[1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&id=top-sql-50)

4.[197. Rising Temperature](https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&id=top-sql-50)

5.[1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&id=top-sql-50)

6.[577. Employee Bonus](https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&id=top-sql-50)

7.[1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&id=top-sql-50)

8.[570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&id=top-sql-50)

9.[1934. Confirmation Rate](https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&id=top-sql-50)

```
Solutions:

1.Select unique_id,name from Employees e left join EmployeeUNI e1 using (id)

2.Select p.product_name,s.year,s.price from Sales s join Product p using (product_id) 

3.Select customer_id , count(visit_id) as count_no_trans from Visits v left join Transactions t using (visit_id)
where t.transaction_id is null
group by customer_id
order by count(visit_id) desc

4. Select w1.id
 from Weather w1 join Weather w2 on w1.recordDate <> w2.recordDate 
 and datediff(w1.recordDate ,w2.recordDate) =1 
 where w1.temperature > w2.temperature

5.SELECT  a.machine_id ,  round(avg(b.timestamp - a.timestamp),3)  as processing_time from Activity a join Activity b on a.machine_id = b.machine_id and a.process_id=b.process_id where a.activity_type = 'start' and b.activity_type = 'end'
group by machine_id 

6.select name,bonus from Employee e left join Bonus b using (empId) having bonus <1000 or bonus is null

7.select st.student_id, st.student_name, sb.subject_name, count(e.subject_name) as attended_exams
from Students st
join Subjects sb
left join
examinations e
on e.student_id = st.student_id
and e.subject_name = sb.subject_name
group by st.student_id, sb.subject_name
order by st.student_id

8.select distinct m.name
from employee e join employee m
on m.id = e.managerid
group by m.id
having count(*) >= 5

9.SELECT 
s.user_id,
ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 ELSE 0.00 END),2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id

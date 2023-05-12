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


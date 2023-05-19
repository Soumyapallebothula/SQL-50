[1978. Employees Whose Manager Left the Company](https://leetcode.com/problems/employees-whose-manager-left-the-company/description/)
```sql
select employee_id from Employees where salary < 30000 and manager_id not in employee_id
order by employee_id
```

--584. Find Customer Referee
--QNS LINK - https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&id=top-sql-50

--Solution:
Select name from Customer where referee_id not in (select * from Customer where referee_id<>2 or referee_id is null )

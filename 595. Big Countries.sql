--595. Big Countries
--QNS LINK: https://leetcode.com/problems/big-countries/?envType=study-plan-v2&id=top-sql-50

--Solution:
select name , population , area from World where population >=25000000 or  area >= 3000000;

--1148. Article Views I
--QNS LINK:https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&id=top-sql-50

--Solution:
Select distinct author_id as id from Views where author_id = viewer_id 
order by author_id asc

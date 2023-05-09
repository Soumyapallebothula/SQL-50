--1683. Invalid Tweets
--QNS LINK : https://leetcode.com/problems/invalid-tweets/?envType=study-plan-v2&id=top-sql-50

--Solution:
Select tweet_id from Tweets where char_length(content)>15

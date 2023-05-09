--1757. Recyclable and Low Fat Products
-- Qns Link : https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&id=top-sql-50

--Solution:
Select product_id from Products where low_fats = 'Y' AND recyclable = 'Y'

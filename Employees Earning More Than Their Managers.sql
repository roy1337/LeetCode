Employees Earning More Than Their Managers

Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.

The query result format is in the following example.


select e1.name as Employee
from employee e1 
join employee e2
on e1.managerid = e2.id
and e1.salary > e2.salary

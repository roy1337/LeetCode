Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The query result format is in the following example.



with cte as (
select dd.name as dename,ee.name as ename,salary, rank() over (partition by dd.name order by salary desc) as ranked
from employee ee
join department dd
on ee.departmentid = dd.id
)

select dename as Department , ename as Employee ,Salary
from cte
where ranked = 1




Second Solution

with cte as (
select  de.name as dename, max(ee.salary) as maxsal
from employee ee
join department de
on ee.departmentid = de.id
group by de.name
)

select dename Department,ee.name Employee, maxsal Salary
from cte
join employee ee
on cte.maxsal = ee.salary

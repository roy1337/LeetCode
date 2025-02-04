department-top-three-salaries
A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write an SQL query to find the employees who are high earners in each of the departments.


select d1.name as 'Department' ,e1.name as 'Employee', e1.salary
from employee e1
join department d1
on e1.departmentid = d1.id
where 3 > (select count(distinct e2.salary) from employee e2
           where e2.salary > e1.salary
           and e2.departmentid = e1.departmentid

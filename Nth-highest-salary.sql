Nth-highest-salary
Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.

select * from employee 
where sal in (select min(sal) from (select distinct top N sal from employee
                            order by sal desc))

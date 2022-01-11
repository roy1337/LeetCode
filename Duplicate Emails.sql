Write an SQL query to report all the duplicate emails.

Return the result table in any order.

The query result format is in the following example.



with cte as  (
select email,count(email)
from person 
group by email
having count(email) > 1
)
select email from cte

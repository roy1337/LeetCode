Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The query result format is in the following example.





select 
case when mod(id,2) = 0 then id-1
when id = (select count(*) from seat) then id
else id+1 end as id, student
from seat 
order by id

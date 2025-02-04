Write an SQL query to display the records with three or more rows with consecutive ids, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The query result format is in the following example.

 
 

select distinct t1.id, t1.visit_date,t1.people
from stadium t1,stadium t2, stadium t3

where t1.people>=100 and t2.people>=100 and t3.people>=100
and 
(
(t1.id - t2.id = 1 and  t1.id - t3.id = 2 and t2.id-t3.id = 1)
or 
(t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id-t3.id = 1)
or 
(t3.id-t2.id =1 and t3.id-t1.id = 2 and t2.id-t1.id=1)
)


order by t1.id

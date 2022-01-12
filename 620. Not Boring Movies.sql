Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The query result format is in the following example.

select id,movie,description,rating
from cinema
where description not like '%boring%'
and mod(id,2)!=0
order by rating desc

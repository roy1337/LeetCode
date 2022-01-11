Trips and Users
Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

select t1.request_at as Day,
round(sum(case when t1.status = 'Completed' then 0 else 1 end) / count(*), 2) as "Cancellation Rate"
from trips t1
join Users u1
on t1.Client_Id = u1.Users_Id 
where t1.Request_at between '2013-10-01' and '2013-10-03' and u1.Banned = 'No'
group by t1.Request_at

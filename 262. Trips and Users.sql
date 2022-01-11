The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between 2013-10-01 and 2013-10-03. Round Cancellation Rate to two decimal points.

Return the result table in any order.

The query result format is in the following example.


/* Write your T-SQL query statement below */
with banned_clients as (

select count(users_id) counted ,users_id from users uu
    join trips tt 
    on tt.client_id = uu.users_id
    where banned = 'Yes'
     group by users_id
),

banned_drivers as (

select count(users_id) counted ,users_id from users uu
    join trips tt 
    on tt.driver_id = uu.users_id
    where banned = 'Yes'
    group by users_id
),

logics as (
select count(*) as total_cancelled, request_at,
sum(case when tt.status = 'cancelled_by_client' or tt.status = 'cancelled_by_driver' then 1 else 0 end) as counted_cancelled
from trips tt 
where driver_id not in(select users_id from banned_drivers)
and client_id not in (select users_id from banned_clients)
and tt.request_at  between "2013-10-01" and "2013-10-03"
group by request_at
)

select request_at as 'Day' ,round(counted_cancelled/total_cancelled,2) as 'Cancellation Rate'
from logics
group by request_at

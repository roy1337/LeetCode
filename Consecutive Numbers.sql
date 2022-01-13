Consecutive Numbers
Write an SQL query to find all numbers that appear at least three times consecutively.

select distinct l1.num as ConsecutiveNums
        from logs l1
        join logs l2
        on l1.id = l2.id -1
        join logs l3
        on l2.id = l3.id -1
        where l1.num = l2.num
        and l2.num = l3.num



one more answer 

 with cte as (
 select 
 lead(num,1) over () as oneafter,
 lag(num,1) over () as onebefore,
 num
 from logs
)

select distinct num as ConsecutiveNums from cte
where num=oneafter and num=onebefore

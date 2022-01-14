183. Customers Who Never Order
Write an SQL query to report all customers who never order anything.

select name as Customers from customers cc
where cc.id not in (select customerid from orders)

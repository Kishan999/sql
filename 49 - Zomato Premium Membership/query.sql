with cte as (
select customer_name , date(order_date) as order_date , count(*) as total_order
from orders 
group by customer_name , date(order_date)
having count(*) > 1)
, order_value as(
select o.customer_name , sum(order_value) as total_order_value,
sum(case when c.customer_name is not null then o.order_value end) as order_value
from orders o left join cte c
on o.customer_name = c.customer_name and date(o.order_date) = c.order_date
where o.customer_name in (select distinct customer_name from cte)
group by o.customer_name
)

select * from order_value
order by total_order_value 
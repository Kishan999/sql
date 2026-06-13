-- cancellation rate , return rate 
with cancelled_order as (
select year(order_date) as order_year
,month(order_date) as order_month,order_id
,case when delivery_date is null and cancel_date is not null 
then 1 else 0 end as cancel_flag 
,case when delivery_date is not null and cancel_date is not null then 1 else 0 end as return_flag 
from orders
)

select order_year,order_month
,round(sum(cancel_flag)*100.0/(count(*)-sum(return_flag)),2)  as cancellation_rate
,round(sum(return_flag)*100.0/(count(*)-sum(cancel_flag)),2) as return_rate
from cancelled_order
group by order_year,order_month
order by order_year,order_month;
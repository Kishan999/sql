-- select * from orders;
-- weekdays and weekend (Queries) (3 order placed)
-- weekdays = 0.20 * weekend

with cte as (select * , (WEEKDAY(order_date) + 1) as week_day
from orders)
, final_table as (
select * from 
(select customer_id , 
sum(case when week_day in (1,2,3,4,5) then 1 else 0 end) as total_order_weekdays,
sum(case when week_day in (6,7) then 1 else 0 end) as total_order_weekend,
avg(case when week_day in (1,2,3,4,5) then order_amount end) as total_amount_weekdays, 
avg(case when week_day in (6,7) then order_amount end) as total_amount_weekend 
from cte
group by customer_id ) inn_qry
where total_order_weekdays >= 3 and total_order_weekend >= 3
)
, cte1 as (
select *,
((total_amount_weekend - total_amount_weekdays)/total_amount_weekdays)* 100 as percent_diff
from final_table)

select customer_id , total_amount_weekend , total_amount_weekdays , round(percent_diff , 2) 
from cte1 
where percent_diff > 20
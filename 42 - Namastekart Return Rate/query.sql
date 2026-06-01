with total_orders as (
select customer_name , count(*) as total_order from orders 
group by customer_name)
, total_return_order as 
	(
	select customer_name , count(*) as total_return from
	(
select customer_name , return_date from orders o left join returns r on o.order_id = r.order_id) inn_qry
	where return_date is not null
	group by customer_name
	)
select * from 
(select customer_name , round((total_return*100.0/total_order) , 2) as return_percent from 
(select tos.customer_name , total_order , coalesce(total_return , 0) as total_return from 
total_orders tos left join total_return_order tro on tos.customer_name = tro.customer_name) inn_qry2) inn_qry3
where return_percent > 50
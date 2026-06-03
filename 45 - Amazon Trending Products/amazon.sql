
select order_month , product_id from (
select 
	order_month,
	product_id, 
	sales, 
	sum(sales) OVER (partition by product_id
        order by order_month
        ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) AS last_2_months_sales,
	row_number() Over(partition by product_id order by order_month) as rn
from orders 
) inn_qry 
where last_2_months_sales < sales and 
rn >= 3
order by order_month
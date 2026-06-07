with final_products as (
select product_id , price , price_date as valid_from , 
lead(price_date,1,'9999-12-31') over(partition by product_id order by price_date) as valid_till
from products)

select p.product_id , sum(price) as total_sales
from final_products p inner join orders o
on p.product_id = o.product_id and 
o.order_date >= valid_from and 
o.order_date < valid_till 
group by p.product_id
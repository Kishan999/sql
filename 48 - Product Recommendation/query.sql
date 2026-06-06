select o1.product_id , o2.product_id , count(*) as order_frq
from orders o1 join orders o2 on o1.order_id = o2.order_id 
where o1.product_id > o2.product_id 
group by o1.product_id , o2.product_id
order by order_frq desc
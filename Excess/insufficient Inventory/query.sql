with cte as (
select location_id , sum(excess_insufficient_qty) as excess_insufficient_qtys , sum(excess_insufficient_value) as excess_insufficient_values 
from (
select location_id, case when inventory_level > inventory_target then 'excess' else 'insufficient' end as warehouse_data 
, (inventory_level - inventory_target) as excess_insufficient_qty , 
((unit_cost*inventory_level) - (unit_cost*inventory_target)) as excess_insufficient_value
from inventory i join products p on
i.product_id = p.product_id) innqry
group by location_id)

, tables as (
select 'Overall' , sum(excess_insufficient_qtys) as excess_insufficient_qty , sum(excess_insufficient_values) as excess_insufficient_value from cte)

select * from cte 
union all 
select * from tables


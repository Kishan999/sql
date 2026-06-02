with final_table as (
	select lift_id , capacity_kg , passenger_name , weight_kg 
from lifts l join lift_passengers lp on l.id = lp.lift_id)

, total_weight as (
	select * , sum(weight_kg) over(partition by lift_id order by lift_id , weight_kg) as cummulative_sum from final_table)
	, cte as (
	select lift_id , 
	case when cummulative_sum <= capacity_kg then
	GROUP_CONCAT(passenger_name SEPARATOR ', ') end as passenger_list from total_weight
		-- where passenger_list is not null
	group by lift_id , cummulative_sum , capacity_kg)
	
	select lift_id , GROUP_CONCAT(passenger_list SEPARATOR ', ') as passenger_list from cte 
	where passenger_list is not null
	group by lift_id

select id , count(*) as total_rodes , sum(case when start_time = prev_end_time and start_loc = prev_end_loc then 1 else 0 end ) as total_profit_rides from (
select * , 
	lag(end_time , 1 ) over(partition by id order by start_time) as prev_end_time,
		lag(end_loc , 1 ) over(partition by id order by start_time) as prev_end_loc
	from drivers) inn_qry
	group by id
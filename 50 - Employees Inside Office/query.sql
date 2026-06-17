-- select count(distinct emp_id) from employee_record 
-- where created_at < '2019-04-01 19:05:00'
-- and action = 'in'
with cte as (
select * , row_number() over(partition by emp_id order by created_at asc) as emp_in from employee_record
where created_at < '2019-04-01 19:05:00')
, final as (select emp_id , max(emp_in) as latest_update from cte 
group by emp_id )
select count(*) from (
select 
	CASE WHEN latest_update % 2 = 0 THEN 'Even'
           ELSE 'Odd'
       END AS num_type
	  from final) inn_qry
	  where num_type = 'Odd'

-- select 
-- 	emp_id , created_at, action , emp_in ,
-- 	case when (max(emp_in)%2 = 0) then 'emp_in_office' else 'emp_outside' end as status
-- 	from cte 
-- 	group by emp_id , created_at, action
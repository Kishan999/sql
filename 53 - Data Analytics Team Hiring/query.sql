-- seniour at most 

with tables as (
select emp_id , experience , salary , sum(salary)  over(partition by experience order by salary rows between unbounded preceding and current row) as running_total from candidates
group by emp_id , experience , salary)

, seniors as (
select * from tables 
	where experience = 'Senior' and running_total <= 70000
	order by salary desc
)

select emp_id , experience , salary from seniors
union all 
select emp_id , experience , salary from tables 
where experience = 'Junior' and running_total <= 70000-(select sum(salary) from seniors)
order by salary desc
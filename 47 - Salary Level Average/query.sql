select level , round(avg(salary),0) as avg_salary from (
select salary , 
	case when salary < 50000 then 'Low' 
	 when salary >= 50000 and salary <= 100000 then 'Medium' else 'High' end as level
from Employees) inn_qry
group by level
order by level 
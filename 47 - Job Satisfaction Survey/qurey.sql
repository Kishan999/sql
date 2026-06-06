with cte as (
select country , job_satisfaction , sum(total_response) as  number_of_respondents from (
select country, job_satisfaction , count(*) as total_response from survey 
group by country , job_satisfaction
order by job_satisfaction , total_response desc) inn_qry
group by job_satisfaction , country
)
-- , country_table as (
-- select country, job_satisfaction , count(*) as total_response from survey 
-- group by country , job_satisfaction
-- order by job_satisfaction , total_response desc
-- )
-- , final as (
-- select country , sum(total_response) as number_of_respondents
-- from country_table 
-- group by country)
, final as (
select * , sum(number_of_respondents) over(partition by job_satisfaction order by job_satisfaction desc) as final_data,
dense_rank() over(partition by job_satisfaction order by number_of_respondents desc) as raning 
from cte)

select  job_satisfaction , country , final_data 
from final 
where raning = 1
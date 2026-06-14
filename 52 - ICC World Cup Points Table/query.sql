with cte as (
select team_1 as team,
case when team_1 = winner then 1 else 0 end as win_flag ,
case when winner = 'Draw' then 1 else 0 end as draw_flag 
from icc_world_cup
union all 
select team_2 ,
case when team_2 = winner then 1 else 0 end as win_flag ,
case when winner = 'Draw' then 1 else 0 end as draw_flag 
from icc_world_cup)

select team , 
count(*) as number_of_matches,
sum(win_flag) as num_of_wins,
count(*) - sum(win_flag) - sum(draw_flag) as num_of_losses,
2*sum(win_flag) + sum(draw_flag) as total_points
from cte
group by team
order by team 

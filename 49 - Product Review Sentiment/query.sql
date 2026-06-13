
with cte as (
select review_id , product_id , lower(review_text) as review_text
from product_reviews 
)

select * from cte
where (review_text like '% excellent%' or review_text like '% amazing%') and review_text not like '%not excellent%' and review_text not like '%not amazing%'
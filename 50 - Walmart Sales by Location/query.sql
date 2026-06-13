WITH monthly_sales AS (
    SELECT
        s.location,
        month(t.transaction_date) AS order_month,
        SUM(t.amount) AS total_sales,
        RANK() OVER (PARTITION BY s.location ORDER BY SUM(t.amount) DESC) AS sales_rank_desc,
        RANK() OVER (PARTITION BY s.location ORDER BY SUM(t.amount)) AS sales_rank_asc
    FROM
        transactions t
    JOIN
        stores s ON t.store_id = s.store_id
    GROUP BY
        s.location, month(t.transaction_date))
SELECT
    location,
    MAX(CASE WHEN sales_rank_desc = 1 THEN order_month END) AS highest_sales_month,
    MAX(CASE WHEN sales_rank_asc = 1 THEN order_month END) AS lowest_sales_month
FROM  monthly_sales
GROUP BY location
ORDER BY location;

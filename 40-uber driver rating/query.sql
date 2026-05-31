WITH cte AS (
    SELECT
        driver_id,
        avg_rating,
        ROW_NUMBER() OVER (ORDER BY avg_rating DESC) AS driver_ranking,
        COUNT(*) OVER () AS total_drivers
    FROM driver_ratings
)
SELECT
    driver_id,
    avg_rating,
    CASE
        WHEN driver_ranking <= CEILING(total_drivers / 3.0)
            THEN 'Top'
        WHEN driver_ranking <= CEILING(2.0 * total_drivers / 3.0)
            THEN 'Middle'
        ELSE 'Bottom'
    END AS performance_tier
FROM cte
ORDER BY avg_rating DESC;
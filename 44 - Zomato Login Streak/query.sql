-- Classic "gaps and islands": for consecutive dates, (date - row_number) stays
-- constant within a streak, so it can be used as a group key for each island.
WITH distinct_days AS (
    SELECT DISTINCT user_id, login_date
    FROM user_logins
),
grouped AS (
    SELECT
        user_id,
        login_date,
        login_date - (ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY login_date
        ))::int AS streak_group
    FROM distinct_days
),
streaks AS (
    SELECT
        user_id,
        streak_group,
        COUNT(*) AS streak_length
    FROM grouped
    GROUP BY user_id, streak_group
)
SELECT
    user_id,
    MAX(streak_length) AS max_streak
FROM streaks
GROUP BY user_id
ORDER BY user_id;

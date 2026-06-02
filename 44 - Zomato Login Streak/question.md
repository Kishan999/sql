# Zomato Login Streak

Zomato wants to reward its most engaged users. To do this, the growth team needs to find how loyal each user is based on how consistently they open the app.

A **login streak** is the number of **consecutive calendar days** on which a user logged in at least once. A user may log in multiple times on the same day, but a single day should only be counted once. A streak breaks the moment there is a day with no login.

## Task

Write an SQL query to find, for each user, the length of their **longest login streak** (the maximum number of consecutive days they logged in).

- Multiple logins on the same day count as a **single** day.
- A streak must be made of **back-to-back** calendar days (no gaps).
- Output `user_id` and `max_streak`.
- Display the output in **ascending** order of `user_id`.

## Schema

### `user_logins`

| Column       | Type |
|--------------|------|
| `user_id`    | int  |
| `login_date` | date |

## Example

If user `1` logged in on `2024-01-01`, `2024-01-02`, `2024-01-02`, `2024-01-03`, `2024-01-07`, `2024-01-08`, then:

- The first streak is `2024-01-01` → `2024-01-03` = **3 days**.
- The second streak is `2024-01-07` → `2024-01-08` = **2 days**.
- `max_streak` = **3**.

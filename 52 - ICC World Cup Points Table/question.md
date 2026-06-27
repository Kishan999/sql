# ICC World Cup Points Table

You are given a table of cricket matches played in an ICC cricket tournament with the details of the winner for each match. You need to derive a points table using the rules below.

## Rules

1. For each **win**, a team gets **2 points**.
2. For a **loss**, a team gets **0 points**.
3. In case of a **draw**, both teams get **1 point** each.

## Task

Display **team name**, **matches played**, **# of wins**, **# of losses**, and **points**. Sort the output in **ascending order of team name**.

## Schema

### `icc_world_cup`

| Column   | Type        |
|----------|-------------|
| `team_1` | varchar(10) |
| `team_2` | varchar(10) |
| `winner` | varchar(10) |

## Notes

- Each row represents one match between `team_1` and `team_2`.
- For a completed match with a winner, `winner` holds the name of the winning team (`team_1` or `team_2`).
- For a drawn match, `winner` is `'draw'`.
- A draw is not counted as a win or a loss for either team.

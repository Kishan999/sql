# Lift Maximum Passengers

You are given a list of lifts, their maximum capacity, and the people (along with their weight) who want to enter each lift. You need to make sure the **maximum number of people** enter into the lift without the lift getting overloaded.

## Task

For each lift, find the **comma separated list of people** who can be accommodated.

- The goal is to fit as **many people as possible** into a lift without exceeding its `capacity_kg`.
- To maximize the number of people, prefer the **lightest** passengers first.
- The comma separated list should list people in the order of their weight in **increasing** order.
- If a lift cannot accommodate anyone, it should still appear in the output (with an empty list).
- Display the output in **increasing** order of `id`.

## Schema

### `lifts`

| Column        | Type |
|---------------|------|
| `capacity_kg` | int  |
| `id`          | int  |

### `lift_passengers`

| Column           | Type        |
|------------------|-------------|
| `passenger_name` | varchar(10) |
| `weight_kg`      | int         |
| `lift_id`        | int         |

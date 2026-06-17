# Employees Inside Office

A company records its employees' movement **In** and **Out** of the office in a table.

## Notes about the data

1. The **first entry** for each employee is `in`.
2. Every `in` is succeeded by an `out`.
3. An employee can work **across days** (an `in` on one day may be paired with an `out` on a later day).

## Task

Write an SQL query to find the **number of employees inside the office** at `2019-04-01 19:05:00`.

An employee is inside the office at that moment if their most recent action **at or before** `2019-04-01 19:05:00` was an `in`.

## Schema

### `employee_record`

| Column       | Type       |
|--------------|------------|
| `emp_id`     | int        |
| `action`     | varchar(3) |
| `created_at` | datetime   |

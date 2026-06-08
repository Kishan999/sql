# Salary Level Average

Write an SQL query to find the **average salary** of employees at each **salary level**.

## Salary Level

A "Salary Level" is defined as per the conditions below:

| Condition | Salary Level |
|-----------|--------------|
| Salary is **less than 50000** | `Low` |
| Salary is **between 50000 and 100000** (inclusive) | `Medium` |
| Salary is **greater than 100000** | `High` |

## Task

- Group employees by their salary level and compute the **average salary** for each level.
- **Round** the average to the **nearest integer**.
- Display the output in **ascending** order of salary level.

## Schema

### `Employees`

| Column          | Type        |
|-----------------|-------------|
| `employee_id`   | int         |
| `employee_name` | varchar(20) |
| `salary`        | int         |

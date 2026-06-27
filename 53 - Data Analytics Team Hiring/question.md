# Data Analytics Team Hiring

Suppose you are a manager of a data analytics company. You are tasked to build a new team consists of senior and junior data analysts. The total budget for the salaries is 70000. You need to use the below criterion for hiring:

1. Keep hiring the seniors with the smallest salaries until you cannot hire anymore seniors.
2. Use the remaining budget to hire the juniors with the smallest salaries until you cannot hire anymore juniors.

Display employee id, experience and salary. Sort in decreasing order of salary.

## Schema

### `candidates`

| Column       | Type        |
|--------------|-------------|
| `emp_id`     | int         |
| `experience` | varchar(6)  |
| `salary`     | int         |

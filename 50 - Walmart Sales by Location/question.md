# Walmart Sales by Location

You are tasked with analyzing the sales data of a Walmart chain with multiple stores across different locations. The company wants to identify the **highest** and **lowest** sales months for each location for the year **2023** to gain insights into their sales patterns.

## Task

Write an SQL query to find, for each location:

- the month with the **highest** total sales, and
- the month with the **lowest** total sales.

Display the output in **ascending** order of `location`. In case of a tie, display the **latest** month.

## Schema

### `stores`

| Column       | Type         |
|--------------|--------------|
| `store_id`   | int          |
| `store_name` | varchar(20)  |
| `location`   | varchar(20)  |

### `transactions`

| Column             | Type |
|--------------------|------|
| `customer_id`      | int  |
| `store_id`         | int  |
| `amount`           | int  |
| `transaction_date` | date |
| `transaction_id`   | int  |

# Namastekart Return Rate

Namastekart, an e-commerce company, has observed a notable surge in return orders recently. They suspect that a specific group of customers may be responsible for a significant portion of these returns. To address this issue, their initial goal is to identify customers who have returned more than 50% of their orders so they can proactively reach out to gather feedback.

## Task

Write an SQL query to find the list of customers along with their **return percent** (round to **2 decimal places**).

- **Return percent** for a customer = (number of returned orders ÷ total orders placed by that customer) × 100
- An order counts as returned if it has a matching row in `returns` (joined on `order_id`)
- Include only customers whose return percent is **greater than 50**
- Display the output in **ascending** order of `customer_name`

## Schema

### `orders` (primary key: `order_id`)

| Column          | Type         |
|-----------------|--------------|
| `customer_name` | varchar(10)  |
| `order_date`    | date         |
| `order_id`      | int          |
| `sales`         | int          |

### `returns` (primary key: `order_id`)

| Column        | Type |
|---------------|------|
| `order_id`    | int  |
| `return_date` | date |

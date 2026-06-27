# Zomato Order Behavior

Suppose you are a data analyst working for Zomato (an online food delivery company). Zomato is interested in analysing customer food ordering behavior and wants to identify customers who have exhibited inconsistent patterns over time.

## Task

Write an SQL query to identify customers who have placed orders on both weekdays and weekends, but with a significant difference in the average order amount between weekdays and weekends.

Specifically, identify customers who have:

- a minimum of **3 orders** placed on weekdays, and
- a minimum of **3 orders** placed on weekends, and
- an average order amount on weekends that is **at least 20% higher** than the average order amount on weekdays.

Return the customer id, the average order amount on weekends, the average order amount on weekdays, and the percentage difference (round to **2 decimal places**) in average order amount between weekends and weekdays for each customer meeting the criteria.

## Schema

### `orders`

| Column         | Type          |
|----------------|---------------|
| `order_id`     | int           |
| `customer_id`  | int           |
| `order_amount` | decimal(10,2) |
| `order_date`   | date          |

## Notes

- Treat **Saturday** and **Sunday** as weekends; **Monday** through **Friday** as weekdays.
- **Percentage difference** = `((avg_weekend_amount - avg_weekday_amount) / avg_weekday_amount) × 100`.
- A customer qualifies only if they have **at least 3 orders on weekdays** and **at least 3 orders on weekends**, and their weekend average is **at least 20% higher** than their weekday average.

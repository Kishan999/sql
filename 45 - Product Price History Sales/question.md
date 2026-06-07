# Product Price History Sales

You are given a `products` table where a **new row is inserted every time the price of a product changes**. Each row records the price that became effective on a given `price_date`. Additionally, there is an `orders` table containing details such as `order_date` and `product_id` for each order.

## Task

Write an SQL query to calculate the **total sales value** for each product, considering the price of the product **as it was at the time of the order date**.

- For each order, the applicable price is the product's **most recent price on or before** the `order_date` (the latest `price_date` that is `<= order_date`).
- The **total sales value** for a product is the sum of the applicable prices across all of its orders.
- Display the output in **ascending** order of `product_id`.

## Schema

### `products`

| Column       | Type |
|--------------|------|
| `product_id` | int  |
| `price`      | int  |
| `price_date` | date |

### `orders`

| Column       | Type |
|--------------|------|
| `order_id`   | int  |
| `order_date` | date |
| `product_id` | int  |

## Example

If product `1` has prices:

- `100` effective `2024-01-01`
- `120` effective `2024-03-01`

And there are orders for product `1` on `2024-02-10` and `2024-04-05`, then:

- The `2024-02-10` order uses price `100` (latest price on or before that date).
- The `2024-04-05` order uses price `120`.
- **Total sales value** = `100 + 120 = 220`.

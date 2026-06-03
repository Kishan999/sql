# Amazon Trending Products

Amazon wants to find out the trending products for each month. A product is **trending** in a given month when its sales in that month are **greater than** the combined sales of the **previous two months** for that same product.

## Task

Identify all trending products by month and return:

- `order_month`
- `product_id`

### Requirements

- A product is trending in month **M** when:  
  `sales(M) > sales(M-1) + sales(M-2)`
- The metric requires two prior months of history, so **exclude the first two months** of operations from the output.
- Assume each product has **at least 1 sale** in every month.
- Sort the final output by `order_month` (ascending).

## Schema

### `orders`

| Column        | Type        |
|---------------|-------------|
| `order_month` | varchar(6)  |
| `product_id`  | varchar(5)  |
| `sales`       | int         |

`order_month` is in `YYYYMM` format (for example, `202401` for January 2024).

## Example

Sample data for product `P1001`:

| order_month | product_id | sales |
|-------------|------------|-------|
| 202401      | P1001      | 10    |
| 202402      | P1001      | 15    |
| 202403      | P1001      | 30    |
| 202404      | P1001      | 20    |

Month-by-month evaluation for `P1001`:

| order_month | Current sales | Previous 2 months sum | Trending? |
|-------------|---------------|------------------------|-----------|
| 202401      | 10            | — (not enough history) | No output |
| 202402      | 15            | — (not enough history) | No output |
| 202403      | 30            | 10 + 15 = 25           | Yes (30 > 25) |
| 202404      | 20            | 15 + 30 = 45           | No (20 ≤ 45) |

Expected output for this product:

| order_month | product_id |
|-------------|------------|
| 202403      | P1001      |

## Solution Approach

### 1. Order months chronologically

Treat `order_month` as a time sequence. Sort months in ascending order so that “previous month” and “two months ago” refer to the correct calendar periods.

Because `order_month` uses `YYYYMM`, lexicographic (alphabetical) sorting matches chronological order.

### 2. Compute prior-month sales per product

For each `(order_month, product_id)` row, derive:

- **Previous month sales** — sales for the same product in month M−1
- **Two months ago sales** — sales for the same product in month M−2

Work at the **product level**: each product’s history is evaluated independently.

Conceptually, this is a **rolling lookback of two months** per product. For every row, you need the sales values from the two immediately preceding months for that same `product_id`.

### 3. Apply the trending rule

For each product-month pair (starting from the third month in the dataset):

- Compute `prior_two_months_sum = sales(M-1) + sales(M-2)`
- Mark the row as trending when `sales(M) > prior_two_months_sum`

Strict inequality matters: equal sales do **not** qualify as trending.

### 4. Filter and format output

- Drop rows from the **first two months** of operations (globally, not per product), since the metric is undefined without two prior months.
- Keep only rows that satisfy the trending condition.
- Return `order_month` and `product_id`.
- Sort by `order_month` ascending.

## Edge Cases and Assumptions

- **First two months**: Never appear in the output, regardless of product.
- **No trending products in a month**: That month simply contributes no rows.
- **Multiple trending products in one month**: Each qualifying product appears as its own row with the same `order_month`.
- **At least one sale per product per month**: Given by the problem; no need to handle zero or missing sales.

## Expected Output Shape

| order_month | product_id |
|-------------|------------|
| 202403      | P1001      |
| 202403      | P2002      |
| 202405      | P3003      |

Rows are sorted by `order_month`. Within the same month, product order is not specified unless additional sorting is required.

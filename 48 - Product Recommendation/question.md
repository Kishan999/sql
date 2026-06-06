# Product Recommendation

Product recommendation in its simplest form — **"customers who bought this also bought…"** — is an outcome of **basket analysis**. By finding products frequently purchased together in the same order, platforms like Amazon can suggest complementary items to users at checkout or on product pages.

## Task

Write an SQL query to find **product pairs** that have been purchased together in the same order, along with their **purchase frequency** (the number of times the pair appears together across all orders).

### Requirements

- A pair consists of two distinct products from the **same** `order_id`.
- Return each unique pair **once** — do not list `(P3, P1)` and `(P1, P3)` separately.
- The **first product column** must always have an `product_id` **greater than** the second product column.
- Sort the output by purchase frequency in **descending** order.

## Schema

### `orders`

| Column        | Type        | Notes              |
|---------------|-------------|--------------------|
| `order_id`    | int         | Primary key        |
| `customer_id` | int         |                    |
| `product_id`  | varchar(2)  |                    |

Each row represents one product in an order. An order with three products will have three rows sharing the same `order_id`.

## Example

Sample data:

| order_id | customer_id | product_id |
|----------|-------------|------------|
| 1        | 101         | P1         |
| 1        | 101         | P3         |
| 2        | 102         | P1         |
| 2        | 102         | P3         |
| 3        | 103         | P1         |
| 3        | 103         | P2         |
| 4        | 104         | P2         |
| 4        | 104         | P3         |

Pair frequency breakdown:

| product_1 | product_2 | Orders together | purchase_frequency |
|-----------|-----------|-----------------|-------------------|
| P3        | P1        | 1, 2            | 2                 |
| P3        | P2        | 4               | 1                 |
| P2        | P1        | 3               | 1                 |

Expected output:

| product_1 | product_2 | purchase_frequency |
|-----------|-----------|-------------------|
| P3        | P1        | 2                 |
| P3        | P2        | 1                 |
| P2        | P1        | 1                 |

## Solution Approach

### 1. Pair products within the same order

Self-join `orders` on `order_id` so that every product in an order is matched with every other product in that same order.

Add a filter so only distinct pairs are kept and each pair appears once:

- `o1.product_id > o2.product_id`

This ensures the first column always holds the greater `product_id`.

### 2. Count co-purchase frequency

Group by `(product_1, product_2)` and count how many orders contain both products.

Use `COUNT(DISTINCT order_id)` if the same product can appear more than once in a single order; otherwise a plain `COUNT(*)` after deduplicating at the `(order_id, product_id)` level is equivalent.

### 3. Sort output

Order by `purchase_frequency` descending so the most frequently bought-together pairs appear first.

## Edge Cases

- **Single-product orders**: No pairs are formed; these orders contribute nothing to the output.
- **Duplicate product in one order**: Deduplicate at `(order_id, product_id)` before pairing so the same product does not inflate pair counts.
- **Tied frequency**: Multiple pairs can share the same count; secondary sort order is not specified unless required.
- **No co-purchases**: If no order contains two or more distinct products, the result is empty.

## Expected Output Shape

| product_1 | product_2 | purchase_frequency |
|-----------|-----------|-------------------|
| P3        | P1        | 2                 |
| P3        | P2        | 1                 |
| P2        | P1        | 1                 |

Rows are sorted by `purchase_frequency` descending. `product_1` is always lexicographically (or by defined ID ordering) greater than `product_2`.

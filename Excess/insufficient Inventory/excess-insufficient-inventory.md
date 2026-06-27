# Excess and Insufficient Inventory

Suppose you are a data analyst working for Flipkart. Your task is to identify excess and insufficient inventory at various Flipkart warehouses in terms of number of units and cost. Excess inventory is when inventory levels are greater than inventory targets; otherwise it is insufficient inventory.

## Task

Write an SQL query to derive excess/insufficient inventory volume and value in cost for each location as well as at the overall company level. Display the results in **ascending** order of `location_id`.

## Schema

### `inventory`

| Column             | Type |
|--------------------|------|
| `inventory_level`  | int  |
| `inventory_target` | int  |
| `location_id`      | int  |
| `product_id`       | int  |

### `products`

| Column       | Type          |
|--------------|---------------|
| `product_id` | int           |
| `unit_cost`  | decimal(5,2)  |

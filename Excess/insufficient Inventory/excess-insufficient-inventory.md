Suppose you are a data analyst working for Flipkart. Your task is to identify excess and insufficient inventory at various Flipkart warehouses in terms of no of units and cost.  Excess inventory is when inventory levels are greater than inventory targets else its insufficient inventory.

Write an SQL to derive excess/insufficient Inventory volume and value in cost for each location as well as at overall company level, display the results in ascending order of location id.

 

Table: inventory
+------------------+-----------+
| COLUMN_NAME      | DATA_TYPE |
+------------------+-----------+
| inventory_level  | int       |
| inventory_target | int       |
| location_id      | int       |
| product_id       | int       |
+------------------+-----------+
Table: products
+-------------+--------------+
| COLUMN_NAME | DATA_TYPE    |
+-------------+--------------+
| product_id  | int          |
| unit_cost   | decimal(5,2) |
+-------------+--------------+


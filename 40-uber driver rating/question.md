# Uber Driver Performance Tiers

Suppose you are a data analyst working for ride-sharing platform Uber. Uber is interested in analyzing the performance of drivers based on their ratings and wants to categorize them into different performance tiers.

## Task

Write an SQL query to categorize drivers **equally** into three performance tiers (**Top**, **Middle**, and **Bottom**) based on their average ratings.

- Drivers with the **highest** average ratings → **Top** tier
- Drivers with ratings **below** the top tier but **above** the bottom tier → **Middle** tier
- Drivers with the **lowest** average ratings → **Bottom** tier

Sort the output in **decreasing** order of average rating.

## Schema

### `driver_ratings`

| Column       | Type           |
|--------------|----------------|
| `driver_id`  | int            |
| `avg_rating` | decimal(3,2)   |

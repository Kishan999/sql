# Uber Profit Rides

A **profit ride** for an Uber driver is a ride whose **start location** and **start time** exactly match the **end location** and **end time** of that driver’s **immediately previous** ride.

## Task

Write an SQL query to calculate, for each driver:

- Total number of rides
- Total number of profit rides

Display the output in **ascending** order of `id`.

## Schema

### `drivers`

| Column       | Type         |
|--------------|--------------|
| `id`         | varchar(10)  |
| `start_loc`  | varchar(1)   |
| `start_time` | time         |
| `end_loc`    | varchar(1)   |
| `end_time`   | time         |

Each row is one ride for one driver.

## Example

Rides for driver `D1`:

| id  | start_loc | start_time | end_loc | end_time |
|-----|-----------|------------|---------|----------|
| D1  | A         | 09:00      | B       | 10:00    |
| D1  | B         | 10:00      | C       | 11:00    |
| D1  | C         | 11:30      | D       | 12:30    |
| D1  | D         | 12:30      | A       | 13:30    |

Ordered by `start_time`, ride-by-ride:

| Ride | start_loc | start_time | Previous end | Previous end time | Profit ride? |
|------|-----------|------------|--------------|-------------------|--------------|
| 1    | A         | 09:00      | —            | —                 | No (no prior ride) |
| 2    | B         | 10:00      | B            | 10:00             | Yes |
| 3    | C         | 11:30      | C            | 11:00             | No (time mismatch) |
| 4    | D         | 12:30      | D            | 12:30             | Yes |

Expected output for `D1`:

| id  | total_rides | profit_rides |
|-----|-------------|--------------|
| D1  | 4           | 2            |

## Solution Approach

### 1. Define ride order per driver

“Previous ride” must be defined using a consistent sequence. Order each driver’s rides by `start_time` ascending so the prior row is the immediately preceding ride in time.

If two rides share the same `start_time`, use an additional tie-breaker (for example `end_time`) so ordering is deterministic.

### 2. Compare each ride to the prior ride

For every ride after the first for a given driver, check:

- `start_loc` equals the previous ride’s `end_loc`
- `start_time` equals the previous ride’s `end_time`

Both conditions must hold. A location match alone is not enough if the times differ.

The first ride for each driver has no predecessor and is never a profit ride.

### 3. Aggregate per driver

Group by `id` and compute:

- **Total rides** — count of all rows for that driver
- **Profit rides** — count of rides that satisfy the profit condition in step 2

### 4. Sort output

Return one row per driver, sorted by `id` ascending.

## Edge Cases

- **Single ride per driver**: `total_rides = 1`, `profit_rides = 0`.
- **No profit rides**: `profit_rides = 0` while `total_rides` reflects all rides.
- **Back-to-back profit rides**: Each qualifying ride is counted separately; ride 2 and ride 4 in the example both count if they each match their own previous ride.

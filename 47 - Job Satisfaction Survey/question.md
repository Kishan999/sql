# Job Satisfaction Survey

In some poorly designed UI applications, there is often a lack of data input restrictions. For instance, in a free-text field for country, users might enter variations such as `USA`, `United States of America`, or `US`.

Suppose we have survey data from individuals in the USA about their job satisfaction, rated on a scale of 1 to 5.

## Task

Write an SQL query to:

- Count the number of respondents for each job satisfaction rating
- Include the **country name in the format that occurs most frequently** within that rating
- Display the output in **ascending** order of `job_satisfaction`

## Schema

### `survey`

| Column             | Type         |
|--------------------|--------------|
| `country`          | varchar(20)  |
| `job_satisfaction` | int          |
| `name`             | varchar(10)  |

Each row represents one respondent.

## Example

Sample data:

| country                  | job_satisfaction | name   |
|--------------------------|------------------|--------|
| USA                      | 1                | Alice  |
| US                       | 1                | Bob    |
| USA                      | 2                | Carol  |
| United States of America | 2                | Dave   |
| United States of America | 2                | Eve    |
| US                       | 3                | Frank  |
| USA                      | 3                | Grace  |
| USA                      | 3                | Hank   |
| USA                      | 4                | Ivy    |
| US                       | 4                | Jack   |
| US                       | 4                | Kate   |
| United States of America | 5                | Leo    |
| USA                      | 5                | Mia    |
| USA                      | 5                | Noah   |
| USA                      | 5                | Olivia |

Country format frequency by rating:

| job_satisfaction | USA | US | United States of America | Respondents |
|------------------|-----|----|--------------------------|-------------|
| 1                | 1   | 1  | 0                        | 2           |
| 2                | 0   | 0  | 2                        | 2           |
| 3                | 2   | 1  | 0                        | 3           |
| 4                | 1   | 2  | 0                        | 3           |
| 5                | 3   | 0  | 1                        | 4           |

Most frequent country format per rating:

| job_satisfaction | Most frequent country |
|------------------|-----------------------|
| 1                | USA (tie with US; break alphabetically) |
| 2                | United States of America |
| 3                | USA |
| 4                | US |
| 5                | USA |

Expected output:

| job_satisfaction | respondent_count | country                  |
|------------------|------------------|--------------------------|
| 1                | 2                | USA                      |
| 2                | 2                | United States of America |
| 3                | 3                | USA                      |
| 4                | 3                | US                       |
| 5                | 4                | USA                      |

## Solution Approach

### 1. Group by job satisfaction

Aggregate respondents by `job_satisfaction` and compute the total count per rating.

### 2. Find the most frequent country format per rating

Within each `job_satisfaction` group, count how many times each distinct `country` value appears.

Select the country string with the **highest count** for that rating. This is the **mode** of `country` within each satisfaction level.

If two or more country formats tie for the highest count, pick one deterministically (for example, the alphabetically smallest `country` value).

### 3. Combine and sort

Return one row per rating with:

- `job_satisfaction`
- `respondent_count`
- `country` (the most frequent format for that rating)

Sort the final result by `job_satisfaction` ascending.

## Edge Cases

- **Single respondent at a rating**: That respondent's `country` value is the most frequent by default.
- **Tied country formats**: When multiple country strings share the same highest count within a rating, use a consistent tie-breaker (for example, `MIN(country)`).
- **Missing ratings**: If no respondent has a given rating (for example, no one rated 1), that rating does not appear in the output unless the problem explicitly requires all scale values.
- **Duplicate names**: Count every row in `survey`; `name` identifies respondents but each row is one response.

## Expected Output Shape

| job_satisfaction | respondent_count | country |
|------------------|------------------|---------|
| 1                | 2                | USA     |
| 2                | 2                | United States of America |
| 3                | 3                | USA     |
| 4                | 3                | US      |
| 5                | 4                | USA     |

Rows are sorted by `job_satisfaction` ascending.

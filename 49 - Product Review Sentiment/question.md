# Product Review Sentiment

Your team wants to analyse customer feedback to identify trends and patterns in product reviews — starting with positive language that mentions **"excellent"** or **"amazing"**, while filtering out negated praise.

## Task

Write an SQL query to find all product reviews containing the word **"excellent"** or **"amazing"** in the review text.

### Requirements

- Matching must be **case-insensitive** (e.g. `Excellent`, `AMAZING`, `aMaZiNg` all qualify).
- **Exclude** reviews where the word **"not"** appears **immediately before** "excellent" or "amazing" (e.g. `not excellent`, `Not amazing`).
- Return `review_id`, `product_id`, and `review_text`.
- Sort the output by `review_id` in **ascending** order.

## Schema

### `product_reviews`

| Column        | Type         |
|---------------|--------------|
| `review_id`   | int          |
| `product_id`  | int          |
| `review_text` | varchar(40)  |

## Example

Sample data:

| review_id | product_id | review_text                          |
|-----------|------------|--------------------------------------|
| 1         | 101        | This product is excellent!           |
| 2         | 102        | Not excellent at all                 |
| 3         | 103        | Amazing quality and amazing price    |
| 4         | 104        | It is not amazing                    |
| 5         | 105        | Good but not excellent quality       |
| 6         | 106        | EXCELLENT service                    |
| 7         | 107        | The taste was aMaZiNg                |
| 8         | 108        | Average product, nothing special     |

Which rows qualify:

| review_id | Reason |
|-----------|--------|
| 1         | Contains "excellent" with no preceding "not" |
| 2         | Excluded — "not" immediately precedes "excellent" |
| 3         | Contains "amazing" (twice) with no negation |
| 4         | Excluded — "not" immediately precedes "amazing" |
| 5         | Excluded — "not" immediately precedes "excellent" |
| 6         | Case-insensitive match on "EXCELLENT" |
| 7         | Case-insensitive match on "aMaZiNg" |
| 8         | Excluded — neither keyword present |

Expected output:

| review_id | product_id | review_text                       |
|-----------|------------|-----------------------------------|
| 1         | 101        | This product is excellent!        |
| 3         | 103        | Amazing quality and amazing price |
| 6         | 106        | EXCELLENT service                 |
| 7         | 107        | The taste was aMaZiNg             |

## Solution Approach

### 1. Normalise case for matching

Convert `review_text` to lowercase before applying pattern checks so mixed-case reviews are handled consistently.

### 2. Match whole words "excellent" or "amazing"

Use a regular expression with word boundaries so partial matches inside other words are avoided (e.g. `unexcellent` should not qualify).

```sql
LOWER(review_text) REGEXP '(^|[^a-z])excellent([^a-z]|$)'
OR LOWER(review_text) REGEXP '(^|[^a-z])amazing([^a-z]|$)'
```

### 3. Exclude negated praise

Filter out rows where **"not"** appears immediately before the keyword, allowing one or more spaces between them:

```sql
NOT (
    LOWER(review_text) REGEXP '(^|[^a-z])not[[:space:]]+excellent([^a-z]|$)'
    OR LOWER(review_text) REGEXP '(^|[^a-z])not[[:space:]]+amazing([^a-z]|$)'
)
```

### 4. Sort output

Order by `review_id` ascending.

## Solution

```sql
SELECT
    review_id,
    product_id,
    review_text
FROM product_reviews
WHERE (
    LOWER(review_text) REGEXP '(^|[^a-z])excellent([^a-z]|$)'
    OR LOWER(review_text) REGEXP '(^|[^a-z])amazing([^a-z]|$)'
)
AND NOT (
    LOWER(review_text) REGEXP '(^|[^a-z])not[[:space:]]+excellent([^a-z]|$)'
    OR LOWER(review_text) REGEXP '(^|[^a-z])not[[:space:]]+amazing([^a-z]|$)'
)
ORDER BY review_id;
```

## Edge Cases

- **Mixed case**: `Excellent`, `AMAZING`, and `aMaZiNg` all match after lowercasing.
- **Negated reviews**: `not excellent`, `Not amazing`, and `NOT excellent` are excluded.
- **Multiple keywords**: A review containing both words is returned once if at least one occurrence is not negated.
- **Punctuation**: Words followed by `!`, `.`, or `,` still match via the non-letter boundary check.
- **No qualifying reviews**: If every review is negated or lacks the keywords, the result set is empty.

## Expected Output Shape

| review_id | product_id | review_text |
|-----------|------------|-------------|
| 1         | 101        | ...         |
| 3         | 103        | ...         |
| 6         | 106        | ...         |
| 7         | 107        | ...         |

Rows are sorted by `review_id` ascending.

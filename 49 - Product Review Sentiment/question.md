# Product Review Sentiment

Suppose you are a data analyst working for a retail company, and your team is interested in analysing customer feedback to identify trends and patterns in product reviews.

## Task

Write an SQL query to find all product reviews containing the word **"excellent"** or **"amazing"** in the review text. However, exclude reviews that contain the word **"not"** immediately before **"excellent"** or **"amazing"**.

Please note that the words can be in upper or lower case or a combination of both.

Return `review_id`, `product_id`, and `review_text` for each review meeting the criteria. Display the output in **ascending** order of `review_id`.

## Schema

### `product_reviews`

| Column        | Type         |
|---------------|--------------|
| `review_id`   | int          |
| `product_id`  | int          |
| `review_text` | varchar(40)  |

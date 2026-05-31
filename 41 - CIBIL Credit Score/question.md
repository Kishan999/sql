# CIBIL Credit Score

CIBIL score, often referred to as a credit score, is a numerical representation of an individual's credit worthiness. While the exact formula used by credit bureaus like CIBIL may not be publicly disclosed and can vary slightly between bureaus, the following are some common factors that typically influence the calculation of a credit score:

## Factors

### 1. Payment History (70%)

This accounts for the largest portion of your credit score. It includes factors such as whether you pay your bills on time, any late payments, defaults, bankruptcies, etc.

Assume this accounts for **70%** of your credit score.

A loan or bill payment is **on time** when the matching row in `customer_transactions` has `transaction_date` on or before the obligation's due date (`loan_due_date` or `bill_due_date`). `loan_bill_id` in `customer_transactions` matches `loan_id` or `bill_id`.

### 2. Credit Utilization Ratio (30%)

This is the ratio of your credit card balances to your credit limits. Keeping this ratio low (ideally below 30%) indicates responsible credit usage.

Assume it accounts for **30%** of your score, with the following weight for the utilization component:

| Utilization | Weight |
|-------------|--------|
| Below 30% | 1 |
| Between 30% and 50% (inclusive) | 0.7 |
| Above 50% | 0.5 |

**Credit utilization ratio** (as a percentage):

$$\text{utilization \%} = \frac{\sum \text{bill\_amount}}{\text{credit\_limit}} \times 100$$

Round this ratio to **1 decimal place**.

## Task

Write an SQL query to:

1. Calculate each customer's **credit utilization ratio** (rounded to 1 decimal place).
2. Calculate each customer's **final credit score**:

$$\text{Credit Score} = \frac{\text{on\_time\_loan\_or\_bill\_payment}}{\text{total\_bills\_and\_loans}} \times 70 + \text{Credit Utilization Weight} \times 30$$

Where **Credit Utilization Weight** is `1`, `0.7`, or `0.5` based on the utilization bands above.

Display the output in **ascending** order of `customer_id`.

## Schema

### `customers`

| Column         | Type |
|----------------|------|
| `customer_id`  | int  |
| `credit_limit` | int  |

### `loans`

| Column          | Type |
|-----------------|------|
| `customer_id`   | int  |
| `loan_id`       | int  |
| `loan_due_date` | date |

### `credit_card_bills`

| Column          | Type |
|-----------------|------|
| `bill_amount`   | int  |
| `bill_due_date` | date |
| `bill_id`       | int  |
| `customer_id`   | int  |

### `customer_transactions`

| Column             | Type         |
|--------------------|--------------|
| `loan_bill_id`     | int          |
| `transaction_date` | date         |
| `transaction_type` | varchar(10)  |

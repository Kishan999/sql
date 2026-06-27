# Loan Repayment Flags

You're working for a large financial institution that provides various types of loans to customers. Your task is to analyze loan repayment data to assess credit risk and improve risk management strategies.

## Task

Write an SQL query to create **2 flags** for each loan as per the rules below. Display `loan_id`, `loan_amount`, `due_date`, and the 2 flags.

1. **fully_paid_flag**: `1` if the loan was fully repaid irrespective of payment date; otherwise `0`.
2. **on_time_flag**: `1` if the loan was fully repaid on or before `due_date`; otherwise `0`.

## Schema

### `loans`

| Column        | Type |
|---------------|------|
| `loan_id`     | int  |
| `customer_id` | int  |
| `loan_amount` | int  |
| `due_date`    | date |

### `payments`

| Column         | Type |
|----------------|------|
| `amount_paid`  | int  |
| `loan_id`      | int  |
| `payment_date` | date |
| `payment_id`   | int  |

WITH obligations AS (
    SELECT customer_id, loan_id AS obligation_id, loan_due_date AS due_date
    FROM loans
    UNION ALL
    SELECT customer_id, bill_id, bill_due_date
    FROM credit_card_bills
),
payment_history AS (
    SELECT
        o.customer_id,
        COUNT(*) AS total_bills_and_loans,
        SUM(
            CASE
                WHEN EXISTS (
                    SELECT 1
                    FROM customer_transactions ct
                    WHERE ct.loan_bill_id = o.obligation_id
                      AND ct.transaction_date <= o.due_date
                ) THEN 1
                ELSE 0
            END
        ) AS on_time_loan_or_bill_payment
    FROM obligations o
    GROUP BY o.customer_id
),
utilization AS (
    SELECT
        c.customer_id,
        ROUND(
            COALESCE(SUM(ccb.bill_amount), 0) * 100.0 / NULLIF(c.credit_limit, 0),
            1
        ) AS credit_utilization_ratio
    FROM customers c
    LEFT JOIN credit_card_bills ccb ON c.customer_id = ccb.customer_id
    GROUP BY c.customer_id, c.credit_limit
)
SELECT
    c.customer_id,
    COALESCE(u.credit_utilization_ratio, 0.0) AS credit_utilization_ratio,
    COALESCE(ph.on_time_loan_or_bill_payment, 0) * 70.0
        / NULLIF(COALESCE(ph.total_bills_and_loans, 0), 0)
    + CASE
        WHEN COALESCE(u.credit_utilization_ratio, 0) < 30 THEN 1
        WHEN COALESCE(u.credit_utilization_ratio, 0) <= 50 THEN 0.7
        ELSE 0.5
      END * 30 AS credit_score
FROM customers c
LEFT JOIN utilization u ON c.customer_id = u.customer_id
LEFT JOIN payment_history ph ON c.customer_id = ph.customer_id
ORDER BY c.customer_id;

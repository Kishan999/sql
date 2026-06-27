
select 
loan_id , loan_amount , due_date , 
case when (loan_amount = amount_paid) then 1 else 0 end as fully_paid_flag ,
case when ((loan_amount = amount_paid) and (payment_date <= due_date)) then 1 else 0 end as on_time_flag from (
select loan_id , loan_amount , sum(amount_paid) as amount_paid , due_date , max(payment_date) as payment_date from (
select l.loan_id as id, customer_id , loan_amount, due_date , p.* from loans l join Payments p on 
l.loan_id = p.loan_id) innqry
group by loan_id , loan_amount , due_date )
innqry1


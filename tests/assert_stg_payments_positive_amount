WITH

payments
AS
(
    SELECT * FROM {{ref('stg_payments')}}
)

select orderid,
sum(amount) as total_amount
FROM payments
group by orderid
having total_amount < 0

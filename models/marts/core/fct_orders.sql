WITH
orders 
AS
(SELECT * FROM {{ref('stg_orders')}}),

amount
AS
(
SELECT
A.order_id,
A.customer_id,
A.order_date,
B.amount
FROM 
orders as A 
LEFT JOIN 
{{ref('stg_payments')}} as B on A.order_id = B.orderid
)

SELECT * FROM amount
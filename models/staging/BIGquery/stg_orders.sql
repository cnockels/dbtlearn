WITH orders
AS
(
    SELECT 
    ID as order_id,
    user_id as customer_id,
    order_date,
    status 

    FROM {{source('BIGquery', 'orders')}}
)

SELECT * FROM orders
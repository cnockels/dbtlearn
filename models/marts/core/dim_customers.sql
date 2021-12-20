{{config(
    materialized="table"
)}}


WITH customers
AS
(SELECT * FROM {{ref('stg_customers')}}),

orders 
AS
(SELECT * FROM {{ref('fct_orders')}}),


customer_orders 
AS 
(
    SELECT 
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_id) as number_of_orders,
    Sum(amount) as lifetime_value

    FROM orders

    group by 1
),

final 
AS 
(
    select 
    Customers.customer_id,
    Customers.first_name,
    Customers.LAST_NAME,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
    customer_orders.lifetime_value
    
    from Customers 
    left join customer_orders using (customer_id) 
)

select * from final 
{{config(
    materialized="table"
)}}

WITH Customers 
AS
(
    SELECT 
ID as customer_id,
first_name,
LAST_NAME

FROM 
`macro-landing-333115.dbt_cnockels.customers`
),

ORDERS
AS
(
    SELECT 
    ID as order_id,
    user_id as customer_id,
    order_date,
    status 

    FROM `macro-landing-333115.dbt_cnockels.orders`

),
customer_orders 
AS 
(
    SELECT 
    customer_id,

    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_date) as number_of_orders

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
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders 

    from Customers 

    left join customer_orders using (customer_id)

)

select * from final 
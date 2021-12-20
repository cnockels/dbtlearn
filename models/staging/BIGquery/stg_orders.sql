WITH orders
AS
(
    SELECT 
    ID as order_id,
    user_id as customer_id,
    order_date,
    status 

    FROM `macro-landing-333115.dbt_cnockels.orders`
)

SELECT * FROM orders
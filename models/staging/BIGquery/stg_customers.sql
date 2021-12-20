WITH customers 
AS
(
    SELECT 
ID as customer_id,
first_name,
LAST_NAME

FROM 
`macro-landing-333115.dbt_cnockels.customers`
)

SELECT * FROM customers
WITH customers 
AS
(
    SELECT 
ID as customer_id,
first_name,
LAST_NAME

FROM 
{{source('BIGquery', 'customers')}}
)

SELECT * FROM customers
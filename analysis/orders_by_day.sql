with orders 
as
(select 
* 
FROM
{{ref('stg_orders')}}
),

daily 
as
(
    select 
    order_date,
    count(*) as order_num
    FROM orders
    group by 1

),

compared 
as(
    select *,
    lag(order_num) over(order by order_date) as previous_day_orders
    FROM daily
)

SELECT * FROM compared
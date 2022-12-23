with
    orders as (select * from {{ ref('stg_orders') }}),

    daily as (order_date, count(*) as order_num from orders)

select *
from daily

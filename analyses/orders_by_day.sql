with
    orders as (select * from {{ ref('stg_orders') }}),

    daily as (
        select
            order_date,
            count(*) as order_num
            {% for order_status in [
    "return",
    "completed",
    "return_pending",
    "shipped",
    "placed",
] %}
            sum(
                case when status = {{ order_status }} then 1 else 0 end
            ) as {{ order_status }}_total
            {% endfor %}
        from orders
        group by 1
    ),

    compared as (
        select *, lag(order_num) over (order by order_date) as previous_day_order
    )

select *
from compared

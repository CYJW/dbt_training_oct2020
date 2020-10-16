with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),
final as (
    select payments.order_id, 
        orders.customer_id , 
        orders.order_date,
        orders.status,
        sum(payments.amount) as amount
    from payments
    join orders using(order_id)
    where payments.status = 'success'
    group by 1,2,3,4
)

select * from final
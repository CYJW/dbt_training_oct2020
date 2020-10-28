select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount as raw_amount,
    {{cents2dollars('amount')}} as amount_dollars,
    created,
    _batched_at
from {{source('stripe','payment')}}
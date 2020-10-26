SELECT
    ID AS PAYMENT_ID,
    ORDERID AS ORDER_ID,
    PAYMENTMETHOD AS PAYMENT_METHOD,
    STATUS,
    AMOUNT AS RAW_AMOUNT,
    {{cents2dollars('AMOUNT')}} as AMOUNT_DOLLARS,
    CREATED,
    _BATCHED_AT
FROM {{source('stripe','payment')}}
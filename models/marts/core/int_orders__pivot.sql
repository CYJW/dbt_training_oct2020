{%- set payment_methods = ['bank_transfer','coupon','credit_card','gift_card'] -%}

with payments as (
    select * from {{ ref('stg_payments') }}
),

pivoted as (
    select
        order_id,
        {% for p in payment_methods -%}
            sum(case when payment_method = '{{p}}' then amount else 0 end) as {{p}}_payment 
            {%- if not loop.last -%} 
            , 
            {%- endif %}
        {% endfor -%}

    from payments
    where status = 'success'
    group by 1
        )
)


sum(case when payment_method = 'bank_transfer' then amount else 0 end) as bank_transfer_payment,

select 
{% macro cents2dollars(field_in_cents, decimal_places = 2) %}
    round( {{field_in_cents}} /100 , {{decimal_places}})
{%endmacro%}

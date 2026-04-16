{% macro convert_to_usd(column_name, exchange_rate=1) %}
    -- This logic multiplies the column by whatever rate we provide
    round({{ column_name }} * {{ exchange_rate }}, 2)
{% endmacro %}
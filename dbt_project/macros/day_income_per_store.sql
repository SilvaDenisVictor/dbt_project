{% macro day_income_per_store(id_store) %}
    SELECT O.StoreID, O.OrderDate, SUM(O.Revenue) AS total_income
    FROM {{ ref('orders_fact') }} O
    GROUP BY O.StoreID, O.OrderDate
    HAVING O.StoreID = {{ id_store }}
    ORDER BY O.OrderDate
{% endmacro %}
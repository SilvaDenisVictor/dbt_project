{% set expected_counts ={
    'customers': 10,
    'employees': 10,
    'stores': 10,
    'suppliers': 5,
    'products': 10,
    'orderitems': 10,
    'orders': 10
}%}



{% for table, expected_count in expected_counts.items() %}
    SELECT '{{ table }}' AS table_name,
            (SELECT COUNT(*) FROM {{ source('landing', table) }}) AS record_count,
            {{ expected_count }} AS expected_count
    WHERE record_count < expected_count
    {% if not loop.last %} UNION ALL {% endif %}
{% endfor %}
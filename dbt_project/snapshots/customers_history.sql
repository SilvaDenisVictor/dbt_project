{% snapshot customers_history %}

{{
    config(
        target_schema='L3_consumption',
        unique_key='CUSTOMERID',
        strategy='check',
        check_cols= ['Phone', 'Email'],
        invalidate_hard_deletes=True
    )
}}
--timestamp
--updated_at=
SELECT * FROM {{source('landing', 'customers')}}

{% endsnapshot %}
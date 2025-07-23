{{
    config(
        materialized='incremental',
        unique_key='id',
        on_schema_change='fail'
    )
}}

select id, name, firstname, lastname, age, email, address, city, state, zip, phone_number, dbt_updated_at as updated_at
from {{ ref('snap_customers') }}
where
{% if is_incremental() %}

    dbt_valid_to is null and dbt_updated_at >= (select max(updated_at) from {{ this }} )

{% else %}

    dbt_valid_to is null

{% endif %}
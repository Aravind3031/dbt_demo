with

source as (

    select * from {{ source('crm', 'customers') }}

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        CAST(name AS VARCHAR(255))as customer_name

    from source

)

select * from renamed
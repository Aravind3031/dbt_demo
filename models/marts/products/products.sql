with

products as (

    select * from {{ ref('stg_pos__products') }}

)

select * from products
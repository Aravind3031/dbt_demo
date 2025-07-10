with

supplies as (

    select * from {{ ref('stg_pos__supplies') }}

)

select * from supplies
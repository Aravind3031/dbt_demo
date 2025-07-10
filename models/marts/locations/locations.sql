with

locations as (

    select * from {{ ref('stg_pos__stores') }}

)

select * from locations
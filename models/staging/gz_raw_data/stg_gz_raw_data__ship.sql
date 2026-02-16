with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost as log_cost,
        Cast(ship_cost as INT64) as ship_cost

    from source

)

select * from renamed
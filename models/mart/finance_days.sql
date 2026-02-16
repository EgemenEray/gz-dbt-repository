with orders_per_day as
(
    select 
        date_date
        ,COUNT(DISTINCT orders_id) as nb_transactions
        ,ROUND(SUM(revenue,0)) as revenue
        ,ROUND(SUM(margin),0) AS margin
		,ROUND(SUM(operational_margin),0) AS operational_margin
		,ROUND(SUM(purchase_cost),0) AS purchase_cost
		,ROUND(SUM(shipping_fee),0) AS shipping_fee
		,ROUND(SUM(log_cost),0) AS log_cost
		,ROUND(SUM(ship_cost),0) AS ship_cost
		,SUM(quantity) AS quantity
    FROM {{ref("int_orders_operational")}}
    Group by date_date
)
select 
    , date_date
    , revenue
    , margin
    , operational_margin
    , purchase_cost
    , shipping_fee
    , log_cost
    , ship_cost
    , quantity
    , ROUND(revenue/NULLIF(nb_transactions, 0), 2) as average_basket
from orders_per_day
order by date_date DESC
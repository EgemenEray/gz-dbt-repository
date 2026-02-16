select 
    o.orders_id
    ,o.date_date
	,ROUND(o.margin + s.shipping_fee - (s.log_cost + s.ship_cost),2) AS operational_margin
	,o.quantity
	,o.revenue
	,o.purchase_cost
	,o.margin
	,s.shipping_fee
	,s.log_cost
	,s.ship_cost from {{ref("int_orders_margin")}} o
Left JOIN {{ref("stg_gz_raw_data__ship")}} s
USING (orders_id)
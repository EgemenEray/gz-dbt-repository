select
    date_date,
    operational_margin-ads_cost as ads_margin,
    round(average_basket,2) as average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
from {{ref('int_campaigns_day')}}
FULL OUTER JOIN {{ref('finance_days')}}
USING (date_date)
order by date_date DESC
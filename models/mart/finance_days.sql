-- The finance team has communicated that they want the following data at a daily granularity:
-- Date
-- Total number of transactions
-- Total revenue
-- Average Basket
-- Operational Margin
-- Total purchase cost
-- Total shipping fees
-- Total log costs
-- Total quantity of products sold.
-- finance_days.sql
SELECT
date_date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue), 2) AS total_revenue,
ROUND(SUM(revenue) /NULLIF(COUNT(orders_id),0), 2) AS Average Basket,
ROUND(SUM(operational_margin), 2) AS Operational_margin,
ROUND(SUM(purchase_cost), 2) AS total_purchase_cost,                 
ROUND(SUM(shipping_fee), 2) AS total_shipping_fee,
ROUND(SUM(logcost), 2) AS total_logcost,
ROUND(SUM(total_quantity), 2) AS total_quantity_sold

FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC


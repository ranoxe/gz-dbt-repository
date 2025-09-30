SELECT
    m.orders_id,
    m.date_date,
    
    -- 1. Calcul de la Marge Opérationnelle (avec ROUND et AS)
    ROUND ((m.margin + sh.shipping_fee - sh.logcost - sh.ship_cost),2) AS operational_margin,
    
    -- 2. Correction: Ajout d'une virgule après la colonne précédente
    m.quantity, 
    
    m.revenue, 
    
    -- 3. Correction: Ajout d'une virgule après la colonne précédente
    m.purchase_cost,
    
    m.margin, 
    sh.shipping_fee,
    sh.logcost, -- NOTE : S'il y a une erreur ici, vérifiez si le nom exact est 'log_cost' (avec underscore) dans stg_raw__ship.
    sh.ship_cost
    
FROM {{ref("int_orders_margin")}} m
LEFT JOIN {{ref("stg_raw__ship")}} sh
    USING (orders_id)
    
ORDER BY m.orders_id DESC
 

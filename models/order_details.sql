SELECT od.order_id,
       od.product_id,
       od.unit_price,
       od.quantity,
       p.product_name,
       p.supplier_id,
       p.category_id,
       (od.unit_price*od.quantity) AS total,
       (p.unit_price*od.quantity)-(od.unit_price*od.quantity) AS discount
FROM {{source('sources', 'order_details')}} od
LEFT JOIN {{source('sources', 'products')}} p ON od.product_id = p.product_id
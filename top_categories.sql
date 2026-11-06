SELECT
coalesce(t.product_category_name_english, p.product_category_name) AS category, 
count (DISTINCT oi.order_id) AS total_orders, 
round (SUM (oi.price), 2) AS revenue, 
round (AVG(oi. price), 2) AS avg_item_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_name t ON p.product_category_name = t.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
HAVING COUNT (DISTINCT oi.order_id) >= 100
ORDER BY revenue DESC
LIMIT 10;

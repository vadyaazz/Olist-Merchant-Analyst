SELECT
		s.seller_id,
		s.seller_city,
		s.seller_state,
COUNT (DISTINCT oi.order_id) AS total_orders,
ROUND (SUM (oi.price), 2) AS revenue
FROM order_items oi
JOIN sellers s on oi.seller_id = s.seller_id
JOIN orders o on oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY revenue DESC
LIMIT 10;

WITH seller_revenue AS (
SELECT oi.seller_id, SUM(oi.price) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
)
SELECT
CASE
WHEN revenue >= 10000 THEN 'High'
WHEN revenue >= 1000 THEN 'Mid'
ELSE 'Low'
END AS segment,
COUNT(*) AS total_sellers,
ROUND(SUM(revenue), 2) AS segment_revenue,
ROUND(100.0 * SUM(revenue) / (SELECT SUM(revenue) FROM seller_revenue), 1) AS pct_of_total_revenue
FROM seller_revenue
GROUP BY segment
ORDER BY segment_revenue DESC;

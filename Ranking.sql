-- Basic Customer Revenue Ranking Analysis
SELECT customer_id, name, total_revenue,
       ROW_NUMBER() OVER (ORDER BY total_revenue DESC) as row_num,
       RANK() OVER (ORDER BY total_revenue DESC) as rank_num,
       DENSE_RANK() OVER (ORDER BY total_revenue DESC) as dense_rank_num,
       ROUND(PERCENT_RANK() OVER (ORDER BY total_revenue DESC) * 100, 2) as percent_rank
FROM (
    SELECT c.customer_id, c.name, SUM(t.amount) as total_revenue
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.name
)
ORDER BY total_revenue DESC;
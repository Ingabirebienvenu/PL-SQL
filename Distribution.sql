SELECT customer_id, name, total_spent,
       NTILE(4) OVER (ORDER BY total_spent DESC) AS quartile,
       ROUND(CUME_DIST() OVER (ORDER BY total_spent DESC) * 100, 2) AS cumulative_percent
FROM (
    SELECT c.customer_id, c.name, SUM(t.amount) AS total_spent
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.name
)
ORDER BY total_spent DESC;
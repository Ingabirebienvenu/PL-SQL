SELECT product_id,
       TO_CHAR(sale_date, 'YYYY-MM') AS month,
       SUM(amount) AS total_sales,
       LAG(SUM(amount)) OVER (PARTITION BY product_id ORDER BY TO_CHAR(sale_date, 'YYYY-MM')) AS prev_month_sales,
       ROUND(
           (SUM(amount) - LAG(SUM(amount)) OVER (PARTITION BY product_id ORDER BY TO_CHAR(sale_date, 'YYYY-MM')))
           / LAG(SUM(amount)) OVER (PARTITION BY product_id ORDER BY TO_CHAR(sale_date, 'YYYY-MM')) * 100, 2
       ) AS growth_pct
FROM transactions
GROUP BY product_id, TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY product_id, month;
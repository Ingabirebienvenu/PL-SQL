-- ================================
-- SUM() Example: Running totals
-- ================================

-- ROWS version: strict row order
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       SUM(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_sum_rows
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;

-- RANGE version: groups tied dates together
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       SUM(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_sum_range
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;

-- ================================
-- AVG() Example: Moving average
-- ================================

-- ROWS version: last 3 transactions only
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       AVG(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_rows
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;

-- RANGE version: all transactions sharing the same date
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       AVG(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS moving_avg_range
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;

-- ================================
-- MIN() & MAX() Example: Trends
-- ================================

-- ROWS version: row-by-row cumulative min/max
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       MIN(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS min_so_far_rows,
       MAX(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS max_so_far_rows
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;

-- RANGE version: cumulative min/max considering tied dates
SELECT c.customer_id, c.name, t.sale_date, t.amount,
       MIN(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS min_so_far_range,
       MAX(t.amount) OVER (
           PARTITION BY c.customer_id 
           ORDER BY t.sale_date 
           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS max_so_far_range
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_id, t.sale_date;
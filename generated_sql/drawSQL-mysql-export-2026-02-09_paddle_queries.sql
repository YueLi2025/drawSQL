-- SQLite queries for: drawSQL-mysql-export-2026-02-09_paddle
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have status=string for their subscription?
SELECT * FROM customers;

-- 2. [EASY] How many customers do we have in total?
SELECT COUNT(*) FROM customers;

-- 3. [EASY] Show me all of our customers.
SELECT * FROM customers;

-- 4. [EASY] Can you look up the customer with id=num?
SELECT * FROM customers WHERE id = num;

-- 5. [EASY] How many customers were created since updated_at=date?
SELECT COUNT(*) FROM customers
WHERE updated_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent customers ordered by billable_id?
SELECT * FROM customers ORDER BY updated_at DESC LIMIT num;

-- 7. [EASY] How many subscriptions do we have in total?
SELECT COUNT(*) FROM subscriptions;

-- 8. [EASY] Show me all of our subscriptions.
SELECT * FROM subscriptions;

-- 9. [MEDIUM] How much revenue since created_at=date?
SELECT * FROM customers LIMIT num;

-- 10. [MEDIUM] How many customers were added since updated_at=date?
SELECT COUNT(*) FROM customers
WHERE updated_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the customers by billable_type — how many in each?
SELECT billable_type, COUNT(*) as count FROM customers GROUP BY billable_type;

-- 12. [MEDIUM] Are there any customers that don't have a match in related tables?
SELECT * FROM customers LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 customers?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY billable_type ORDER BY id DESC) as rn
  FROM customers
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of customers change month over month?
SELECT
  strftime('%Y-%m', updated_at) as period,
  COUNT(*) as count
FROM customers
WHERE updated_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which customers have duplicate or repeated values?
WITH grouped AS (
  SELECT billable_type, COUNT(*) as cnt FROM customers GROUP BY billable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] What's our total and average quantity across all subscriptions?
SELECT SUM(quantity) as total, AVG(quantity) as average FROM subscriptions;

-- 17. [HARD] Pull together a report on customers joining all related tables.
SELECT * FROM customers;

-- 18. [HARD] Who or what is the best in each group of customers?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY billable_type ORDER BY id DESC) as rn
  FROM customers
) WHERE rn = num;

-- 19. [HARD] Which customers are above average compared to others in their group?
SELECT
  strftime('%Y-%m', updated_at) as period,
  COUNT(*) as count
FROM customers
WHERE updated_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group customers, filter, then rank the results.
WITH grouped AS (
  SELECT billable_type, COUNT(*) as cnt FROM customers GROUP BY billable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of customers over time based on updated_at.
SELECT *, COUNT(*) OVER (ORDER BY updated_at) as running_count
FROM customers
ORDER BY updated_at;

-- 22. [HARD] Find customers that exist in one table but not in a related table.
SELECT * FROM customers LIMIT num;

-- 23. [HARD] Combine data from customers, subscriptions, and receipts in a single report.
SELECT * FROM customers
LEFT JOIN subscriptions ON subscriptions.id = customers.id
LEFT JOIN receipts ON receipts.id = customers.id;

-- 24. [HARD] Rank all customers within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY billable_type ORDER BY id DESC) as rn
  FROM customers
) WHERE rn <= num;


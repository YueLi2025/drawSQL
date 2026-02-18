-- SQLite queries for: drawSQL-mysql-export-2026-02-09_paddle
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have an active subscription?
SELECT * FROM customers LIMIT 10;

-- 2. [EASY] How many customers do we have?
SELECT COUNT(*) FROM customers;

-- 3. [EASY] Show me all of our customers.
SELECT * FROM customers;

-- 4. [EASY] Can you look up a specific customer?
SELECT * FROM customers WHERE id = ?;

-- 5. [EASY] What customers were added or changed recently?
SELECT * FROM customers ORDER BY updated_at DESC LIMIT 50;

-- 6. [EASY] What are the different billable id values we have?
SELECT * FROM customers LIMIT 10;

-- 7. [EASY] How many subscriptions do we have?
SELECT COUNT(*) FROM subscriptions;

-- 8. [EASY] Show me all of our subscriptions.
SELECT * FROM subscriptions;

-- 9. [MEDIUM] How much money did we make this month?
SELECT * FROM customers LIMIT 10;

-- 10. [MEDIUM] What are our best-selling products?
SELECT * FROM customers LIMIT 10;

-- 11. [MEDIUM] How many customers did we have last month?
SELECT COUNT(*) FROM customers
WHERE updated_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many customers in each?
SELECT billable_type, COUNT(*) as count FROM customers GROUP BY billable_type;

-- 13. [MEDIUM] Are there any customers that don't have a match somewhere else?
SELECT * FROM customers LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY billable_type ORDER BY id DESC) as rn
  FROM customers
) WHERE rn <= 3;

-- 15. [MEDIUM] What's our total or average quantity across all subscriptions?
SELECT SUM(quantity) as total, AVG(quantity) as average FROM subscriptions;

-- 16. [MEDIUM] How many subscriptions did we have last month?
SELECT COUNT(*) FROM subscriptions
WHERE updated_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM customers;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT billable_type, COUNT(*) as cnt FROM customers GROUP BY billable_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY billable_type ORDER BY quantity DESC) as rn
  FROM subscriptions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM subscriptions t1
WHERE quantity > (
  SELECT AVG(quantity) FROM subscriptions t2 WHERE t2.billable_type = t1.billable_type
);


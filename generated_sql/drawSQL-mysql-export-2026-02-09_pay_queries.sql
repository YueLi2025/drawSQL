-- SQLite queries for: drawSQL-mysql-export-2026-02-09_pay
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have status=string for their subscription?
SELECT * FROM pay_charges;

-- 2. [EASY] How many pay charges do we have in total?
SELECT COUNT(*) FROM pay_charges;

-- 3. [EASY] Show me all of our pay charges.
SELECT * FROM pay_charges;

-- 4. [EASY] Can you look up the pay charge with id=num?
SELECT * FROM pay_charges WHERE id = num;

-- 5. [EASY] How many pay charges were created since created_at=date?
SELECT COUNT(*) FROM pay_charges
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What pay charges have amount between num and num?
SELECT * FROM pay_charges WHERE amount BETWEEN num AND num ORDER BY amount;

-- 7. [EASY] What are the most recent pay charges ordered by owner_type?
SELECT * FROM pay_charges ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many subscriptions do we have in total?
SELECT COUNT(*) FROM pay_charges;

-- 9. [MEDIUM] How much revenue since created_at=date?
SELECT * FROM pay_charges LIMIT num;

-- 10. [MEDIUM] What's our total and average amount across all pay charges?
SELECT SUM(amount) as total, AVG(amount) as average FROM pay_charges;

-- 11. [MEDIUM] Which pay charge has the highest amount?
SELECT * FROM pay_charges ORDER BY amount DESC LIMIT 1;

-- 12. [MEDIUM] How many pay charges were added since created_at=date?
SELECT COUNT(*) FROM pay_charges
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Break down the pay charges by owner_type — how many in each?
SELECT owner_type, COUNT(*) as count FROM pay_charges GROUP BY owner_type;

-- 14. [MEDIUM] Are there any pay charges that don't have a match in related tables?
SELECT * FROM pay_charges LIMIT num;

-- 15. [MEDIUM] For each group, what are the top 3 pay charges?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY amount DESC) as rn
  FROM pay_charges
) WHERE rn <= num;

-- 16. [MEDIUM] How did the number of pay charges change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM pay_charges
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 17. [HARD] Pull together a report on pay charges joining all related tables.
SELECT * FROM pay_charges;

-- 18. [HARD] Which pay charge has the best amount in each owner_type?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY amount DESC) as rn
  FROM pay_charges
) WHERE rn = num;

-- 19. [HARD] Which pay charges have amount above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM pay_charges
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group pay charges, filter, then rank the results.
WITH grouped AS (
  SELECT owner_type, COUNT(*) as cnt FROM pay_charges GROUP BY owner_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of pay charges over time based on created_at.
SELECT *, SUM(amount) OVER (ORDER BY created_at) as running_total
FROM pay_charges
ORDER BY created_at;

-- 22. [HARD] Find pay charges that exist in one table but not in a related table.
SELECT * FROM pay_charges LIMIT num;

-- 23. [HARD] Rank all pay charges by amount within each owner_type and show percentiles.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY amount DESC) as rn
  FROM pay_charges
) WHERE rn <= num;

-- 24. [HARD] Pull together a report on subscriptions joining all related tables.
SELECT * FROM pay_charges;


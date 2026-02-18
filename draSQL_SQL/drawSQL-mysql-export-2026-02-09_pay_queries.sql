-- SQLite queries for: drawSQL-mysql-export-2026-02-09_pay
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have an active subscription?
SELECT * FROM pay_subscriptions WHERE status = 1;

-- 2. [EASY] How many pay charges do we have?
SELECT COUNT(*) FROM pay_charges;

-- 3. [EASY] Show me all of our pay charges.
SELECT * FROM pay_charges;

-- 4. [EASY] Can you look up a specific pay charge?
SELECT * FROM pay_charges WHERE id = ?;

-- 5. [EASY] What pay charges were added or changed recently?
SELECT * FROM pay_charges ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What pay charges fall within a certain price range?
SELECT * FROM pay_charges LIMIT 10;

-- 7. [EASY] What are the different owner type values we have?
SELECT * FROM pay_charges LIMIT 10;

-- 8. [EASY] How many subscriptions do we have?
SELECT COUNT(*) FROM pay_charges;

-- 9. [MEDIUM] How much money did we make this month?
SELECT * FROM pay_charges LIMIT 10;

-- 10. [MEDIUM] What's our total or average amount across all pay charges?
SELECT SUM(amount) as total, AVG(amount) as average FROM pay_charges;

-- 11. [MEDIUM] How many pay charges did we have last month?
SELECT COUNT(*) FROM pay_charges
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many pay charges in each?
SELECT owner_type, COUNT(*) as count FROM pay_charges GROUP BY owner_type;

-- 13. [MEDIUM] Which pay charge has the highest or lowest amount?
SELECT * FROM pay_charges ORDER BY amount DESC LIMIT 1;

-- 14. [MEDIUM] Are there any pay charges that don't have a match somewhere else?
SELECT * FROM pay_charges LIMIT 10;

-- 15. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY amount DESC) as rn
  FROM pay_charges
) WHERE rn <= 3;

-- 16. [MEDIUM] What's our total or average quantity across all subscriptions?
SELECT SUM(amount) as total, AVG(amount) as average FROM pay_charges;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM pay_charges;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT owner_type, COUNT(*) as cnt FROM pay_charges GROUP BY owner_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY amount DESC) as rn
  FROM pay_charges
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM pay_charges t1
WHERE amount > (
  SELECT AVG(amount) FROM pay_charges t2 WHERE t2.owner_type = t1.owner_type
);


-- SQLite queries for: drawSQL-mysql-export-2026-01-13_stripe
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have an active subscription?
SELECT * FROM users LIMIT 10;

-- 2. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 4. [EASY] Show me all of our users.
SELECT * FROM users;

-- 5. [EASY] Can you look up a specific user?
SELECT * FROM subscriptions WHERE id = ?;

-- 6. [EASY] What users were added or changed recently?
SELECT * FROM users ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different stripe id values we have?
SELECT * FROM users LIMIT 10;

-- 8. [EASY] How many subscriptions do we have?
SELECT COUNT(*) FROM subscriptions;

-- 9. [MEDIUM] How much money did we make this month?
SELECT * FROM users LIMIT 10;

-- 10. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many users in each?
SELECT pm_type, COUNT(*) as count FROM users GROUP BY pm_type;

-- 13. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each subscription along with its related details.
SELECT * FROM users;

-- 16. [MEDIUM] What's our total or average quantity across all subscriptions?
SELECT SUM(quantity) as total, AVG(quantity) as average FROM subscriptions;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM subscription_items
LEFT JOIN subscriptions ON subscription_items.subscription_id = subscriptions.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT pm_type, COUNT(*) as cnt FROM users GROUP BY pm_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM subscriptions
WHERE quantity > (SELECT AVG(quantity) FROM subscriptions);


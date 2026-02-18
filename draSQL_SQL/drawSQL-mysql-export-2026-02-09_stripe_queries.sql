-- SQLite queries for: drawSQL-mysql-export-2026-02-09_stripe
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have an active subscription?
SELECT * FROM subscriptions LIMIT 10;

-- 2. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE pm_expiration >= date('now', '-1 month');

-- 3. [EASY] How many subscriptions do we have?
SELECT COUNT(*) FROM subscriptions;

-- 4. [EASY] Show me all of our subscriptions.
SELECT * FROM subscriptions;

-- 5. [EASY] Can you look up a specific subscription?
SELECT * FROM subscriptions WHERE id = ?;

-- 6. [EASY] Find the subscription with a certain name or email.
SELECT * FROM subscriptions WHERE name = ?;

-- 7. [EASY] Which subscriptions are currently active or turned on?
SELECT * FROM subscriptions LIMIT 10;

-- 8. [EASY] What subscriptions were added or changed recently?
SELECT * FROM subscriptions ORDER BY updated_at DESC LIMIT 50;

-- 9. [MEDIUM] How much money did we make this month?
SELECT * FROM subscriptions LIMIT 10;

-- 10. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] Show me each subscription along with its related details.
SELECT t.*, c.*
FROM subscriptions t
LEFT JOIN subscription_items c ON c.subscription_id = t.id;

-- 12. [MEDIUM] What's our total or average quantity across all subscriptions?
SELECT SUM(quantity) as total, AVG(quantity) as average FROM subscriptions;

-- 13. [MEDIUM] How many subscriptions did we have last month?
SELECT COUNT(*) FROM subscriptions
WHERE updated_at >= date('now', '-1 month');

-- 14. [MEDIUM] Break it down by type or category—how many subscriptions in each?
SELECT user_id, COUNT(*) as count FROM subscriptions GROUP BY user_id;

-- 15. [MEDIUM] Are there any subscriptions that don't have a match somewhere else?
SELECT * FROM subscriptions
WHERE id NOT IN (SELECT DISTINCT subscription_id FROM subscription_items WHERE subscription_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn <= 3;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM subscriptions
LEFT JOIN users ON subscriptions.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM subscriptions GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY quantity DESC) as rn
  FROM subscriptions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM subscriptions
WHERE quantity > (SELECT AVG(quantity) FROM subscriptions);


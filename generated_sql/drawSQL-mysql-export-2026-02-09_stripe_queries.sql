-- SQLite queries for: drawSQL-mysql-export-2026-02-09_stripe
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have status=string for their subscription?
SELECT * FROM subscriptions;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE pm_expiration >= date('now', '-1 month');

-- 3. [EASY] How many subscriptions do we have in total?
SELECT COUNT(*) FROM subscriptions;

-- 4. [EASY] Show me all of our subscriptions.
SELECT * FROM subscriptions;

-- 5. [EASY] Can you look up the subscription with id=num?
SELECT * FROM subscriptions WHERE id = num;

-- 6. [EASY] Find the subscription where name=string.
SELECT * FROM subscriptions WHERE name = string;

-- 7. [EASY] How many subscriptions were created since updated_at=date?
SELECT COUNT(*) FROM subscriptions
WHERE updated_at >= date('now', '-1 month');

-- 8. [EASY] What subscriptions have quantity between num and num?
SELECT * FROM subscriptions WHERE quantity BETWEEN num AND num ORDER BY quantity;

-- 9. [MEDIUM] How much revenue since created_at=date?
SELECT * FROM subscriptions LIMIT num;

-- 10. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] Show me each subscription along with its related details from other tables.
SELECT t.*, c.*
FROM subscriptions t
LEFT JOIN subscription_items c ON c.subscription_id = t.id;

-- 12. [MEDIUM] What's our total and average quantity across all subscriptions?
SELECT SUM(quantity) as total, AVG(quantity) as average FROM subscriptions;

-- 13. [MEDIUM] Which subscription has the highest quantity?
SELECT * FROM subscriptions ORDER BY quantity DESC LIMIT 1;

-- 14. [MEDIUM] How many subscriptions were added since updated_at=date?
SELECT COUNT(*) FROM subscriptions
WHERE updated_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break down the subscriptions by user_id — how many in each?
SELECT user_id, COUNT(*) as count FROM subscriptions GROUP BY user_id;

-- 16. [MEDIUM] Are there any subscriptions that don't have a match in related tables?
SELECT * FROM subscriptions
WHERE id NOT IN (SELECT DISTINCT subscription_id FROM subscription_items WHERE subscription_id IS NOT NULL);

-- 17. [HARD] Pull together a report on subscriptions joining all related tables.
SELECT * FROM subscriptions
LEFT JOIN users ON subscriptions.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of subscriptions?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY quantity DESC) as rn
  FROM subscriptions
) WHERE rn = num;

-- 19. [HARD] Which subscriptions have quantity above average compared to others in their group?
SELECT
  strftime('%Y-%m', updated_at) as period,
  COUNT(*) as count
FROM subscriptions
WHERE updated_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group subscriptions, filter, then rank the results.
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM subscriptions GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of subscriptions over time based on updated_at.
SELECT *, SUM(quantity) OVER (ORDER BY updated_at) as running_total
FROM subscriptions
ORDER BY updated_at;

-- 22. [HARD] Find subscriptions that exist in one table but not in a related table.
SELECT * FROM subscriptions
WHERE id NOT IN (SELECT DISTINCT subscription_id FROM subscription_items WHERE subscription_id IS NOT NULL);

-- 23. [HARD] Combine data from subscriptions, users, and subscription_items in a single report.
SELECT * FROM subscriptions
LEFT JOIN users ON users.id = subscriptions.subscription_id
LEFT JOIN subscription_items ON subscription_items.id = subscriptions.subscription_id;

-- 24. [HARD] Rank all subscriptions within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY quantity DESC) as rn
FROM subscriptions;


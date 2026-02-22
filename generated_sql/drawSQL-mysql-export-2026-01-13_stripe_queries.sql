-- SQLite queries for: drawSQL-mysql-export-2026-01-13_stripe
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have status=string for their subscription?
SELECT * FROM users;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 4. [EASY] Show me all of our users.
SELECT * FROM users;

-- 5. [EASY] Can you look up the user with id=num?
SELECT * FROM subscriptions WHERE id = num;

-- 6. [EASY] How many users were created since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent users ordered by stripe_id?
SELECT * FROM users ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many subscriptions do we have in total?
SELECT COUNT(*) FROM subscriptions;

-- 9. [MEDIUM] How much revenue since created_at=date?
SELECT * FROM users LIMIT num;

-- 10. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the users by pm_type — how many in each?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users LIMIT num;

-- 14. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT pm_type, COUNT(*) as cnt FROM users GROUP BY pm_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM subscription_items
LEFT JOIN subscriptions ON subscription_items.subscription_id = subscriptions.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT pm_type, COUNT(*) as cnt FROM users GROUP BY pm_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM users
ORDER BY created_at;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users LIMIT num;

-- 23. [HARD] Combine data from users, subscriptions, and subscription_items in a single report.
SELECT * FROM users
LEFT JOIN subscriptions ON subscriptions.id = users.subscription_id
LEFT JOIN subscription_items ON subscription_items.id = users.id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY pm_type ORDER BY id DESC) as rn
  FROM users
) WHERE rn <= num;


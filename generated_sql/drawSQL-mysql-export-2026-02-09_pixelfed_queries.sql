-- SQLite queries for: drawSQL-mysql-export-2026-02-09_pixelfed
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms have price between num and num?
SELECT * FROM account_logs LIMIT num;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many account logs do we have in total?
SELECT COUNT(*) FROM account_logs;

-- 4. [EASY] Show me all of our account logs.
SELECT * FROM account_logs;

-- 5. [EASY] Can you look up the account log with id=num?
SELECT * FROM account_logs WHERE id = num;

-- 6. [EASY] How many account logs were created since created_at=date?
SELECT COUNT(*) FROM account_logs
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent account logs ordered by user_id?
SELECT * FROM account_logs ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many activities do we have in total?
SELECT COUNT(*) FROM activities;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account logs were added since created_at=date?
SELECT COUNT(*) FROM account_logs
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the account logs by item_type — how many in each?
SELECT item_type, COUNT(*) as count FROM account_logs GROUP BY item_type;

-- 12. [MEDIUM] Are there any account logs that don't have a match in related tables?
SELECT * FROM account_logs LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 account logs?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY item_type ORDER BY id DESC) as rn
  FROM account_logs
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of account logs change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which account logs have duplicate or repeated values?
WITH grouped AS (
  SELECT item_type, COUNT(*) as cnt FROM account_logs GROUP BY item_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many activities were added since created_at=date?
SELECT COUNT(*) FROM activities
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on account logs joining all related tables.
SELECT * FROM avatars
LEFT JOIN profiles ON avatars.profile_id = profiles.id;

-- 18. [HARD] Who or what is the best in each group of account logs?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY item_type ORDER BY id DESC) as rn
  FROM account_logs
) WHERE rn = num;

-- 19. [HARD] Which account logs are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group account logs, filter, then rank the results.
WITH grouped AS (
  SELECT item_type, COUNT(*) as cnt FROM account_logs GROUP BY item_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of account logs over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM account_logs
ORDER BY created_at;

-- 22. [HARD] Find account logs that exist in one table but not in a related table.
SELECT * FROM account_logs LIMIT num;

-- 23. [HARD] Combine data from account_logs, activities, and avatars in a single report.
SELECT * FROM account_logs
LEFT JOIN activities ON activities.id = account_logs.id
LEFT JOIN avatars ON avatars.id = account_logs.id;

-- 24. [HARD] Rank all account logs within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY item_type ORDER BY id DESC) as rn
  FROM account_logs
) WHERE rn <= num;


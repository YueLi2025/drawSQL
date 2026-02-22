-- SQLite queries for: drawSQL-mysql-export-2026-02-09_screenly
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many api keys do we have in total?
SELECT COUNT(*) FROM api_keys;

-- 3. [EASY] Show me all of our api keys.
SELECT * FROM api_keys;

-- 4. [EASY] Can you look up the api key with id=num?
SELECT * FROM api_keys WHERE id = num;

-- 5. [EASY] Find the api key where name=string.
SELECT * FROM api_keys WHERE name = string;

-- 6. [EASY] How many api keys were created since created_at=date?
SELECT COUNT(*) FROM api_keys
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent api keys ordered by name?
SELECT * FROM api_keys ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many api log do we have in total?
SELECT COUNT(*) FROM api_log;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many api keys were added since created_at=date?
SELECT COUNT(*) FROM api_keys
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the api keys by name — how many in each?
SELECT name, COUNT(*) as count FROM api_keys GROUP BY name;

-- 12. [MEDIUM] Are there any api keys that don't have a match in related tables?
SELECT * FROM api_keys LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 api keys?
SELECT * FROM api_keys ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of api keys change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM api_keys
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which api keys have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_keys GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many api log were added since created_at=date?
SELECT COUNT(*) FROM api_log
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on api keys joining all related tables.
SELECT * FROM api_keys
LEFT JOIN users ON api_keys.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of api keys?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM api_keys
) WHERE rn = num;

-- 19. [HARD] Which api keys are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM api_keys
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group api keys, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_keys GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of api keys over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM api_keys
ORDER BY created_at;

-- 22. [HARD] Find api keys that exist in one table but not in a related table.
SELECT * FROM api_keys LIMIT num;

-- 23. [HARD] Combine data from api_keys, api_log, and password_resets in a single report.
SELECT * FROM api_keys
LEFT JOIN api_log ON api_log.id = api_keys.id
LEFT JOIN password_resets ON password_resets.id = api_keys.id;

-- 24. [HARD] Rank all api keys within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM api_keys;


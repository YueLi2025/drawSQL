-- SQLite queries for: drawSQL-mysql-export-2026-02-09_octobercms
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many backend access log do we have in total?
SELECT COUNT(*) FROM backend_access_log;

-- 3. [EASY] Show me all of our backend access log.
SELECT * FROM backend_access_log;

-- 4. [EASY] Can you look up the backend access log with id=num?
SELECT * FROM backend_access_log WHERE id = num;

-- 5. [EASY] How many backend access log were created since created_at=date?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent backend access log ordered by user_id?
SELECT * FROM backend_access_log ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM backend_access_log;

-- 8. [EASY] Show me all of our users.
SELECT * FROM backend_access_log;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM backend_access_log LIMIT num;

-- 10. [MEDIUM] How many backend access log were added since created_at=date?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the backend access log by user_id — how many in each?
SELECT user_id, COUNT(*) as count FROM backend_access_log GROUP BY user_id;

-- 12. [MEDIUM] Are there any backend access log that don't have a match in related tables?
SELECT * FROM backend_access_log LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 backend access log?
SELECT * FROM backend_access_log ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of backend access log change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM backend_access_log
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which backend access log have duplicate or repeated values?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM backend_access_log GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each user along with its related details from other tables.
SELECT * FROM backend_access_log;

-- 17. [HARD] Pull together a report on backend access log joining all related tables.
SELECT * FROM backend_access_log
LEFT JOIN backend_users ON backend_access_log.user_id = backend_users.id;

-- 18. [HARD] Who or what is the best in each group of backend access log?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM backend_access_log
) WHERE rn = num;

-- 19. [HARD] Which backend access log are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM backend_access_log
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group backend access log, filter, then rank the results.
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM backend_access_log GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of backend access log over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM backend_access_log
ORDER BY created_at;

-- 22. [HARD] Find backend access log that exist in one table but not in a related table.
SELECT * FROM backend_access_log LIMIT num;

-- 23. [HARD] Combine data from backend_access_log, backend_user_groups, and backend_user_preferences in a single report.
SELECT * FROM backend_access_log
LEFT JOIN backend_user_groups ON backend_user_groups.id = backend_access_log.user_group_id
LEFT JOIN backend_user_preferences ON backend_user_preferences.id = backend_access_log.id;

-- 24. [HARD] Rank all backend access log within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM backend_access_log;


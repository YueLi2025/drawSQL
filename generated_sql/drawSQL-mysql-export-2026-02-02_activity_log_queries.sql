-- SQLite queries for: drawSQL-mysql-export-2026-02-02_activity_log
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM activity_log
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activity log do we have in total?
SELECT COUNT(*) FROM activity_log;

-- 3. [EASY] Show me all of our activity log.
SELECT * FROM activity_log;

-- 4. [EASY] Can you look up the activity log with id=num?
SELECT * FROM activity_log WHERE id = num;

-- 5. [EASY] Find the activity log where log_name=string.
SELECT * FROM activity_log WHERE log_name = string;

-- 6. [EASY] How many activity log were created since created_at=date?
SELECT COUNT(*) FROM activity_log
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent activity log ordered by log_name?
SELECT * FROM activity_log ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] Show me the first few activity log from the activity_log table.
SELECT * FROM activity_log LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM activity_log LIMIT num;

-- 10. [MEDIUM] How many activity log were added since created_at=date?
SELECT COUNT(*) FROM activity_log
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the activity log by subject_type — how many in each?
SELECT subject_type, COUNT(*) as count FROM activity_log GROUP BY subject_type;

-- 12. [MEDIUM] Are there any activity log that don't have a match in related tables?
SELECT * FROM activity_log LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 activity log?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of activity log change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activity_log
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which activity log have duplicate or repeated values?
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_log GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Are there any records that exist in one table but not in a related one?
SELECT * FROM activity_log LIMIT num;

-- 17. [HARD] Pull together a report on activity log joining all related tables.
SELECT * FROM activity_log;

-- 18. [HARD] Who or what is the best in each group of activity log?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn = num;

-- 19. [HARD] Which activity log are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activity_log
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group activity log, filter, then rank the results.
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_log GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of activity log over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM activity_log
ORDER BY created_at;

-- 22. [HARD] Find activity log that exist in one table but not in a related table.
SELECT * FROM activity_log LIMIT num;

-- 23. [HARD] Rank all activity log within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn <= num;

-- 24. [HARD] Build a comprehensive report pulling data from multiple tables.
SELECT * FROM activity_log;


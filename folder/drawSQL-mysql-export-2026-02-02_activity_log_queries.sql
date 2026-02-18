-- SQLite queries for: drawSQL-mysql-export-2026-02-02_activity_log
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM activity_log
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activity log do we have?
SELECT COUNT(*) FROM activity_log;

-- 3. [EASY] Show me all of our activity log.
SELECT * FROM activity_log;

-- 4. [EASY] Can you look up a specific activity log?
SELECT * FROM activity_log WHERE id = ?;

-- 5. [EASY] Find the activity log with a certain name or email.
SELECT * FROM activity_log WHERE log_name = ?;

-- 6. [EASY] What activity log were added or changed recently?
SELECT * FROM activity_log ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different log name values we have?
SELECT * FROM activity_log LIMIT 10;

-- 8. [EASY] Give me a list of all activity log.
SELECT * FROM activity_log;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM activity_log LIMIT 10;

-- 10. [MEDIUM] How many activity log did we have last month?
SELECT COUNT(*) FROM activity_log
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many activity log in each?
SELECT subject_type, COUNT(*) as count FROM activity_log GROUP BY subject_type;

-- 12. [MEDIUM] Are there any activity log that don't have a match somewhere else?
SELECT * FROM activity_log LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn <= 3;

-- 14. [MEDIUM] Are there any that exist in one list but not the other?
SELECT * FROM activity_log LIMIT 10;

-- 15. [MEDIUM] How did the numbers change compared to last month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activity_log
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] What are the top few in each category?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn <= 3;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM activity_log;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_log GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_log
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM activity_log LIMIT 10;


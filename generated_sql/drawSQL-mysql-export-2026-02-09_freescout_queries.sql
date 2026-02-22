-- SQLite queries for: drawSQL-mysql-export-2026-02-09_freescout
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets have status=num indicating open?
SELECT * FROM activity_logs LIMIT num;

-- 2. [EASY] Which tickets were created since created_at=date?
SELECT * FROM activity_logs LIMIT num;

-- 3. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many activity logs do we have in total?
SELECT COUNT(*) FROM activity_logs;

-- 5. [EASY] Show me all of our activity logs.
SELECT * FROM activity_logs;

-- 6. [EASY] Can you look up the activity log with id=num?
SELECT * FROM activity_logs WHERE id = num;

-- 7. [EASY] Find the activity log where log_name=string.
SELECT * FROM activity_logs WHERE log_name = string;

-- 8. [EASY] How many activity logs were created since created_at=date?
SELECT COUNT(*) FROM activity_logs
WHERE created_at >= date('now', '-1 month');

-- 9. [MEDIUM] What's the average resolution time for tickets?
SELECT * FROM activity_logs LIMIT num;

-- 10. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many activity logs were added since created_at=date?
SELECT COUNT(*) FROM activity_logs
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the activity logs by subject_type — how many in each?
SELECT subject_type, COUNT(*) as count FROM activity_logs GROUP BY subject_type;

-- 13. [MEDIUM] Are there any activity logs that don't have a match in related tables?
SELECT * FROM activity_logs LIMIT num;

-- 14. [MEDIUM] For each group, what are the top 3 activity logs?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_logs
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of activity logs change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activity_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which activity logs have duplicate or repeated values?
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_logs GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on activity logs joining all related tables.
SELECT * FROM attachments
LEFT JOIN threads ON attachments.thread_id = threads.id
LEFT JOIN users ON attachments.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of activity logs?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_logs
) WHERE rn = num;

-- 19. [HARD] Which activity logs are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activity_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group activity logs, filter, then rank the results.
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_logs GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of activity logs over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM activity_logs
ORDER BY created_at;

-- 22. [HARD] Find activity logs that exist in one table but not in a related table.
SELECT * FROM activity_logs LIMIT num;

-- 23. [HARD] Combine data from activity_logs, attachments, and conversation_folder in a single report.
SELECT * FROM activity_logs
LEFT JOIN attachments ON attachments.id = activity_logs.id
LEFT JOIN conversation_folder ON conversation_folder.id = activity_logs.id;

-- 24. [HARD] Rank all activity logs within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_logs
) WHERE rn <= num;


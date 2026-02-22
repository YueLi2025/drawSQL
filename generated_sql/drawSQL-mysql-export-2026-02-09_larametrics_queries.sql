-- SQLite queries for: drawSQL-mysql-export-2026-02-09_larametrics
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many metrics do we have in total?
SELECT COUNT(*) FROM larametrics_logs;

-- 3. [EASY] Show me all of our metrics.
SELECT * FROM larametrics_logs;

-- 4. [EASY] Can you look up the metric with id=num?
SELECT * FROM larametrics_logs WHERE id = num;

-- 5. [EASY] Find the metric where email=string.
SELECT * FROM larametrics_logs WHERE email = string;

-- 6. [EASY] How many metrics were created since created_at=date?
SELECT COUNT(*) FROM larametrics_logs
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent metrics ordered by level?
SELECT * FROM larametrics_logs ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] What are the most recent metrics ordered by model?
SELECT * FROM larametrics_logs ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many metrics were added since created_at=date?
SELECT COUNT(*) FROM larametrics_logs
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the metrics by level — how many in each?
SELECT level, COUNT(*) as count FROM larametrics_logs GROUP BY level;

-- 12. [MEDIUM] Are there any metrics that don't have a match in related tables?
SELECT * FROM larametrics_logs LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 metrics?
SELECT * FROM larametrics_logs ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of metrics change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM larametrics_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which metrics have duplicate or repeated values?
WITH grouped AS (
  SELECT level, COUNT(*) as cnt FROM larametrics_logs GROUP BY level
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Break down the metrics by model — how many in each?
SELECT level, COUNT(*) as count FROM larametrics_logs GROUP BY level;

-- 17. [HARD] Pull together a report on metrics joining all related tables.
SELECT * FROM larametrics_logs
LEFT JOIN users ON larametrics_logs.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of metrics?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY level ORDER BY id DESC) as rn
  FROM larametrics_logs
) WHERE rn = num;

-- 19. [HARD] Which metrics are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM larametrics_logs
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group metrics, filter, then rank the results.
WITH grouped AS (
  SELECT level, COUNT(*) as cnt FROM larametrics_logs GROUP BY level
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of metrics over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM larametrics_logs
ORDER BY created_at;

-- 22. [HARD] Find metrics that exist in one table but not in a related table.
SELECT * FROM larametrics_logs LIMIT num;

-- 23. [HARD] Combine data from larametrics_logs, larametrics_models, and larametrics_notifications in a single report.
SELECT * FROM larametrics_logs
LEFT JOIN larametrics_models ON larametrics_models.id = larametrics_logs.id
LEFT JOIN larametrics_notifications ON larametrics_notifications.id = larametrics_logs.id;

-- 24. [HARD] Rank all metrics within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM larametrics_logs;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_larametrics
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many metrics do we have?
SELECT COUNT(*) FROM larametrics_logs;

-- 3. [EASY] Show me all of our metrics.
SELECT * FROM larametrics_logs;

-- 4. [EASY] Can you look up a specific metric?
SELECT * FROM larametrics_logs WHERE id = ?;

-- 5. [EASY] Find the metric with a certain name or email.
SELECT * FROM larametrics_logs WHERE email = ?;

-- 6. [EASY] What metrics were added or changed recently?
SELECT * FROM larametrics_logs ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different level values we have?
SELECT * FROM larametrics_logs LIMIT 10;

-- 8. [EASY] What are the different model values we have?
SELECT * FROM larametrics_logs LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many metrics did we have last month?
SELECT COUNT(*) FROM larametrics_logs
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many metrics in each?
SELECT level, COUNT(*) as count FROM larametrics_logs GROUP BY level;

-- 12. [MEDIUM] Are there any metrics that don't have a match somewhere else?
SELECT * FROM larametrics_logs LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM larametrics_logs LIMIT 10;

-- 14. [MEDIUM] Show me each user along with its related details.
SELECT * FROM larametrics_logs;

-- 15. [MEDIUM] Break it down by type or category—how many users in each?
SELECT id, COUNT(*) as count FROM users GROUP BY id;

-- 16. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM larametrics_logs WHERE user_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM larametrics_logs
LEFT JOIN users ON larametrics_logs.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT level, COUNT(*) as cnt FROM larametrics_logs GROUP BY level
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY level ORDER BY id DESC) as rn
  FROM larametrics_logs
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM larametrics_logs LIMIT 10;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_octobercms
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many backend access log do we have?
SELECT COUNT(*) FROM backend_access_log;

-- 3. [EASY] Show me all of our backend access log.
SELECT * FROM backend_access_log;

-- 4. [EASY] Can you look up a specific backend access log?
SELECT * FROM backend_access_log WHERE id = ?;

-- 5. [EASY] What backend access log were added or changed recently?
SELECT * FROM backend_access_log ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different user id values we have?
SELECT * FROM backend_access_log LIMIT 10;

-- 7. [EASY] How many users do we have?
SELECT COUNT(*) FROM backend_access_log;

-- 8. [EASY] Show me all of our users.
SELECT * FROM backend_access_log;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM backend_access_log LIMIT 10;

-- 10. [MEDIUM] How many backend access log did we have last month?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many backend access log in each?
SELECT user_id, COUNT(*) as count FROM backend_access_log GROUP BY user_id;

-- 12. [MEDIUM] Are there any backend access log that don't have a match somewhere else?
SELECT * FROM backend_access_log LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group ORDER BY value DESC) as rn
  FROM backend_user_preferences
) WHERE rn <= 3;

-- 14. [MEDIUM] Show me each user along with its related details.
SELECT * FROM backend_access_log;

-- 15. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM backend_access_log
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many users in each?
SELECT user_id, COUNT(*) as count FROM backend_access_log GROUP BY user_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM backend_access_log
LEFT JOIN backend_users ON backend_access_log.user_id = backend_users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM backend_access_log GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group ORDER BY value DESC) as rn
  FROM backend_user_preferences
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM backend_user_preferences t1
WHERE value > (
  SELECT AVG(value) FROM backend_user_preferences t2 WHERE t2.group = t1.group
);


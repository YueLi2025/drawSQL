-- SQLite queries for: drawSQL-mysql-export-2026-02-09_pixelfed
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms are available in a certain price range?
SELECT * FROM account_logs LIMIT 10;

-- 2. [EASY] Which rooms have the most bedrooms or bathrooms?
SELECT * FROM account_logs LIMIT 10;

-- 3. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many account logs do we have?
SELECT COUNT(*) FROM account_logs;

-- 5. [EASY] Show me all of our account logs.
SELECT * FROM account_logs;

-- 6. [EASY] Can you look up a specific account log?
SELECT * FROM account_logs WHERE id = ?;

-- 7. [EASY] What account logs were added or changed recently?
SELECT * FROM account_logs ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different user id values we have?
SELECT * FROM account_logs LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account logs did we have last month?
SELECT COUNT(*) FROM account_logs
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many account logs in each?
SELECT item_type, COUNT(*) as count FROM account_logs GROUP BY item_type;

-- 12. [MEDIUM] Are there any account logs that don't have a match somewhere else?
SELECT * FROM account_logs LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY item_type ORDER BY id DESC) as rn
  FROM account_logs
) WHERE rn <= 3;

-- 14. [MEDIUM] How many activities did we have last month?
SELECT COUNT(*) FROM account_logs
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many activities in each?
SELECT item_type, COUNT(*) as count FROM account_logs GROUP BY item_type;

-- 16. [MEDIUM] Are there any activities that don't have a match somewhere else?
SELECT * FROM account_logs LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM avatars
LEFT JOIN profiles ON avatars.profile_id = profiles.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT item_type, COUNT(*) as cnt FROM account_logs GROUP BY item_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY item_type ORDER BY id DESC) as rn
  FROM account_logs
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM account_logs LIMIT 10;


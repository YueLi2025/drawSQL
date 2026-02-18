-- SQLite queries for: drawSQL-mysql-export-2026-02-09_screenly
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many api keys do we have?
SELECT COUNT(*) FROM api_keys;

-- 3. [EASY] Show me all of our api keys.
SELECT * FROM api_keys;

-- 4. [EASY] Can you look up a specific api key?
SELECT * FROM api_keys WHERE id = ?;

-- 5. [EASY] Find the api key with a certain name or email.
SELECT * FROM api_keys WHERE name = ?;

-- 6. [EASY] What api keys were added or changed recently?
SELECT * FROM api_keys ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM api_keys LIMIT 10;

-- 8. [EASY] How many api log do we have?
SELECT COUNT(*) FROM api_keys;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many api keys did we have last month?
SELECT COUNT(*) FROM api_keys
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many api keys in each?
SELECT name, COUNT(*) as count FROM api_keys GROUP BY name;

-- 12. [MEDIUM] Are there any api keys that don't have a match somewhere else?
SELECT * FROM api_keys LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM api_keys LIMIT 10;

-- 14. [MEDIUM] How many api log did we have last month?
SELECT COUNT(*) FROM api_keys
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many api log in each?
SELECT name, COUNT(*) as count FROM api_keys GROUP BY name;

-- 16. [MEDIUM] Are there any api log that don't have a match somewhere else?
SELECT * FROM api_keys LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM api_keys
LEFT JOIN users ON api_keys.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_keys GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM api_keys
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM api_keys LIMIT 10;


-- SQLite queries for: drawSQL-mysql-export-2026-02-02_flarum
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE avatar_url >= date('now', '-1 month');

-- 2. [EASY] How many access tokens do we have?
SELECT COUNT(*) FROM access_tokens;

-- 3. [EASY] Show me all of our access tokens.
SELECT * FROM access_tokens;

-- 4. [EASY] Can you look up a specific access token?
SELECT * FROM api_keys WHERE id = ?;

-- 5. [EASY] What access tokens were added or changed recently?
SELECT * FROM access_tokens ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different token values we have?
SELECT * FROM access_tokens LIMIT 10;

-- 7. [EASY] How many api keys do we have?
SELECT COUNT(*) FROM access_tokens;

-- 8. [EASY] Show me all of our api keys.
SELECT * FROM access_tokens;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many access tokens did we have last month?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many access tokens in each?
SELECT token, COUNT(*) as count FROM access_tokens GROUP BY token;

-- 12. [MEDIUM] Are there any access tokens that don't have a match somewhere else?
SELECT * FROM access_tokens LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM access_tokens LIMIT 10;

-- 14. [MEDIUM] How many api keys did we have last month?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many api keys in each?
SELECT token, COUNT(*) as count FROM access_tokens GROUP BY token;

-- 16. [MEDIUM] Are there any api keys that don't have a match somewhere else?
SELECT * FROM access_tokens LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM access_tokens
LEFT JOIN users ON access_tokens.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM access_tokens GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM access_tokens
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM settings
WHERE value > (SELECT AVG(value) FROM settings);


-- SQLite queries for: drawSQL-mysql-export-2026-02-02_flarum
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE avatar_url >= date('now', '-1 month');

-- 2. [EASY] How many access tokens do we have in total?
SELECT COUNT(*) FROM access_tokens;

-- 3. [EASY] Show me all of our access tokens.
SELECT * FROM access_tokens;

-- 4. [EASY] Can you look up the access token with id=num?
SELECT * FROM api_keys WHERE id = num;

-- 5. [EASY] How many access tokens were created since created_at=date?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent access tokens ordered by token?
SELECT * FROM access_tokens ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many api keys do we have in total?
SELECT COUNT(*) FROM api_keys;

-- 8. [EASY] Show me all of our api keys.
SELECT * FROM api_keys;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many access tokens were added since created_at=date?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the access tokens by token — how many in each?
SELECT token, COUNT(*) as count FROM access_tokens GROUP BY token;

-- 12. [MEDIUM] Are there any access tokens that don't have a match in related tables?
SELECT * FROM access_tokens LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 access tokens?
SELECT * FROM access_tokens ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of access tokens change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM access_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which access tokens have duplicate or repeated values?
WITH grouped AS (
  SELECT token, COUNT(*) as cnt FROM access_tokens GROUP BY token
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many api keys were added since created_at=date?
SELECT COUNT(*) FROM api_keys
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on access tokens joining all related tables.
SELECT * FROM access_tokens
LEFT JOIN users ON access_tokens.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of access tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM access_tokens
) WHERE rn = num;

-- 19. [HARD] Which access tokens are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM access_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group access tokens, filter, then rank the results.
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM access_tokens GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of access tokens over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM access_tokens
ORDER BY created_at;

-- 22. [HARD] Find access tokens that exist in one table but not in a related table.
SELECT * FROM access_tokens LIMIT num;

-- 23. [HARD] Combine data from access_tokens, api_keys, and discussion_tag in a single report.
SELECT * FROM access_tokens
LEFT JOIN api_keys ON api_keys.id = access_tokens.id
LEFT JOIN discussion_tag ON discussion_tag.id = access_tokens.id;

-- 24. [HARD] Rank all access tokens within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM access_tokens;


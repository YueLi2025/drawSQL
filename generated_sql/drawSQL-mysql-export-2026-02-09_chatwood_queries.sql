-- SQLite queries for: drawSQL-mysql-export-2026-02-09_chatwood
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many access tokens do we have in total?
SELECT COUNT(*) FROM access_tokens;

-- 3. [EASY] Show me all of our access tokens.
SELECT * FROM access_tokens;

-- 4. [EASY] Can you look up the access token with id=num?
SELECT * FROM access_tokens WHERE id = num;

-- 5. [EASY] How many access tokens were created since created_at=date?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent access tokens ordered by owner_type?
SELECT * FROM access_tokens ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 8. [EASY] Show me all of our users.
SELECT * FROM users;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many access tokens were added since created_at=date?
SELECT COUNT(*) FROM access_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the access tokens by owner_type — how many in each?
SELECT owner_type, COUNT(*) as count FROM access_tokens GROUP BY owner_type;

-- 12. [MEDIUM] Are there any access tokens that don't have a match in related tables?
SELECT * FROM access_tokens LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 access tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY id DESC) as rn
  FROM access_tokens
) WHERE rn <= num;

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
  SELECT owner_type, COUNT(*) as cnt FROM access_tokens GROUP BY owner_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on access tokens joining all related tables.
SELECT * FROM account_users
LEFT JOIN accounts ON account_users.account_id = accounts.id;

-- 18. [HARD] Who or what is the best in each group of access tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY id DESC) as rn
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
  SELECT owner_type, COUNT(*) as cnt FROM access_tokens GROUP BY owner_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of access tokens over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM access_tokens
ORDER BY created_at;

-- 22. [HARD] Find access tokens that exist in one table but not in a related table.
SELECT * FROM access_tokens LIMIT num;

-- 23. [HARD] Combine data from access_tokens, account_users, and accounts in a single report.
SELECT * FROM access_tokens
LEFT JOIN account_users ON account_users.id = access_tokens.id
LEFT JOIN accounts ON accounts.id = access_tokens.account_id
LEFT JOIN users ON users.id = access_tokens.user_id;

-- 24. [HARD] Rank all access tokens within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY owner_type ORDER BY id DESC) as rn
  FROM access_tokens
) WHERE rn <= num;


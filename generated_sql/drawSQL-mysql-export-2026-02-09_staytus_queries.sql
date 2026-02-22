-- SQLite queries for: drawSQL-mysql-export-2026-02-09_staytus
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people are subscribed to get status updates?
SELECT COUNT(*) FROM subscribers;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many api tokens do we have in total?
SELECT COUNT(*) FROM api_tokens;

-- 4. [EASY] Show me all of our api tokens.
SELECT * FROM api_tokens;

-- 5. [EASY] Can you look up the api token with id=num?
SELECT * FROM api_tokens WHERE id = num;

-- 6. [EASY] Find the api token where name=string.
SELECT * FROM api_tokens WHERE name = string;

-- 7. [EASY] How many api tokens were created since created_at=date?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent api tokens ordered by name?
SELECT * FROM api_tokens ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many api tokens were added since created_at=date?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the api tokens by name — how many in each?
SELECT name, COUNT(*) as count FROM api_tokens GROUP BY name;

-- 12. [MEDIUM] Are there any api tokens that don't have a match in related tables?
SELECT * FROM api_tokens LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 api tokens?
SELECT * FROM api_tokens ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of api tokens change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM api_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which api tokens have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_tokens GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many email templates were added since created_at=date?
SELECT COUNT(*) FROM email_templates
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on api tokens joining all related tables.
SELECT * FROM issue_updates
LEFT JOIN service_statuses ON issue_updates.service_status_id = service_statuses.id
LEFT JOIN users ON issue_updates.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of api tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM api_tokens
) WHERE rn = num;

-- 19. [HARD] Which api tokens are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM api_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group api tokens, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_tokens GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of api tokens over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM api_tokens
ORDER BY created_at;

-- 22. [HARD] Find api tokens that exist in one table but not in a related table.
SELECT * FROM api_tokens LIMIT num;

-- 23. [HARD] Combine data from api_tokens, email_templates, and history_items in a single report.
SELECT * FROM api_tokens
LEFT JOIN email_templates ON email_templates.id = api_tokens.id
LEFT JOIN history_items ON history_items.id = api_tokens.id;

-- 24. [HARD] Rank all api tokens within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM api_tokens;


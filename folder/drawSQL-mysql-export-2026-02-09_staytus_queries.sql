-- SQLite queries for: drawSQL-mysql-export-2026-02-09_staytus
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people are subscribed to get status updates?
SELECT COUNT(*) FROM subscribers;

-- 2. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many api tokens do we have?
SELECT COUNT(*) FROM api_tokens;

-- 4. [EASY] Show me all of our api tokens.
SELECT * FROM api_tokens;

-- 5. [EASY] Can you look up a specific api token?
SELECT * FROM api_tokens WHERE id = ?;

-- 6. [EASY] Find the api token with a certain name or email.
SELECT * FROM api_tokens WHERE name = ?;

-- 7. [EASY] What api tokens were added or changed recently?
SELECT * FROM api_tokens ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different name values we have?
SELECT * FROM api_tokens LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many api tokens did we have last month?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many api tokens in each?
SELECT name, COUNT(*) as count FROM api_tokens GROUP BY name;

-- 12. [MEDIUM] Are there any api tokens that don't have a match somewhere else?
SELECT * FROM api_tokens LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM api_tokens LIMIT 10;

-- 14. [MEDIUM] How many email templates did we have last month?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many email templates in each?
SELECT name, COUNT(*) as count FROM api_tokens GROUP BY name;

-- 16. [MEDIUM] Are there any email templates that don't have a match somewhere else?
SELECT * FROM api_tokens LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM issue_updates
LEFT JOIN service_statuses ON issue_updates.service_status_id = service_statuses.id
LEFT JOIN users ON issue_updates.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM api_tokens GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM api_tokens
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM api_tokens LIMIT 10;


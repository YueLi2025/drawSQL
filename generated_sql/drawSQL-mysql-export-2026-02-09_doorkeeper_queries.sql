-- SQLite queries for: drawSQL-mysql-export-2026-02-09_doorkeeper
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many oauth access grants do we have in total?
SELECT COUNT(*) FROM oauth_access_grants;

-- 3. [EASY] Show me all of our oauth access grants.
SELECT * FROM oauth_access_grants;

-- 4. [EASY] Can you look up the oauth access grant with id=num?
SELECT * FROM oauth_access_grants WHERE id = num;

-- 5. [EASY] How many oauth access grants were created since created_at=date?
SELECT COUNT(*) FROM oauth_access_grants
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent oauth access grants ordered by resource_owner_id?
SELECT * FROM oauth_access_grants ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many oauth access tokens do we have in total?
SELECT COUNT(*) FROM oauth_access_tokens;

-- 8. [EASY] Show me all of our oauth access tokens.
SELECT * FROM oauth_access_tokens;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many oauth access grants were added since created_at=date?
SELECT COUNT(*) FROM oauth_access_grants
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the oauth access grants by resource_owner_id — how many in each?
SELECT resource_owner_id, COUNT(*) as count FROM oauth_access_grants GROUP BY resource_owner_id;

-- 12. [MEDIUM] Are there any oauth access grants that don't have a match in related tables?
SELECT * FROM oauth_access_grants LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 oauth access grants?
SELECT * FROM oauth_access_grants ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of oauth access grants change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM oauth_access_grants
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which oauth access grants have duplicate or repeated values?
WITH grouped AS (
  SELECT resource_owner_id, COUNT(*) as cnt FROM oauth_access_grants GROUP BY resource_owner_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many oauth access tokens were added since created_at=date?
SELECT COUNT(*) FROM oauth_access_tokens
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on oauth access grants joining all related tables.
SELECT * FROM oauth_access_grants
LEFT JOIN users ON oauth_access_grants.resource_owner_id = users.id
LEFT JOIN oauth_applications ON oauth_access_grants.application_id = oauth_applications.id;

-- 18. [HARD] Who or what is the best in each group of oauth access grants?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY resource_owner_id ORDER BY id DESC) as rn
  FROM oauth_access_grants
) WHERE rn = num;

-- 19. [HARD] Which oauth access grants are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM oauth_access_grants
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group oauth access grants, filter, then rank the results.
WITH grouped AS (
  SELECT resource_owner_id, COUNT(*) as cnt FROM oauth_access_grants GROUP BY resource_owner_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of oauth access grants over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM oauth_access_grants
ORDER BY created_at;

-- 22. [HARD] Find oauth access grants that exist in one table but not in a related table.
SELECT * FROM oauth_access_grants LIMIT num;

-- 23. [HARD] Combine data from oauth_access_grants, oauth_access_tokens, and oauth_applications in a single report.
SELECT * FROM oauth_access_grants
LEFT JOIN oauth_access_tokens ON oauth_access_tokens.id = oauth_access_grants.id
LEFT JOIN oauth_applications ON oauth_applications.id = oauth_access_grants.application_id;

-- 24. [HARD] Rank all oauth access grants within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM oauth_access_grants;


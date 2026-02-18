-- SQLite queries for: drawSQL-mysql-export-2026-02-09_doorkeeper
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many oauth access grants do we have?
SELECT COUNT(*) FROM oauth_access_grants;

-- 3. [EASY] Show me all of our oauth access grants.
SELECT * FROM oauth_access_grants;

-- 4. [EASY] Can you look up a specific oauth access grant?
SELECT * FROM oauth_access_grants WHERE id = ?;

-- 5. [EASY] What oauth access grants were added or changed recently?
SELECT * FROM oauth_access_grants ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different resource owner id values we have?
SELECT * FROM oauth_access_grants LIMIT 10;

-- 7. [EASY] How many oauth access tokens do we have?
SELECT COUNT(*) FROM oauth_access_grants;

-- 8. [EASY] Show me all of our oauth access tokens.
SELECT * FROM oauth_access_grants;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many oauth access grants did we have last month?
SELECT COUNT(*) FROM oauth_access_grants
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many oauth access grants in each?
SELECT resource_owner_id, COUNT(*) as count FROM oauth_access_grants GROUP BY resource_owner_id;

-- 12. [MEDIUM] Are there any oauth access grants that don't have a match somewhere else?
SELECT * FROM oauth_access_grants LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM oauth_access_grants LIMIT 10;

-- 14. [MEDIUM] How many oauth access tokens did we have last month?
SELECT COUNT(*) FROM oauth_access_grants
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many oauth access tokens in each?
SELECT resource_owner_id, COUNT(*) as count FROM oauth_access_grants GROUP BY resource_owner_id;

-- 16. [MEDIUM] Are there any oauth access tokens that don't have a match somewhere else?
SELECT * FROM oauth_access_grants LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM oauth_access_grants
LEFT JOIN users ON oauth_access_grants.resource_owner_id = users.id
LEFT JOIN oauth_applications ON oauth_access_grants.application_id = oauth_applications.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT resource_owner_id, COUNT(*) as cnt FROM oauth_access_grants GROUP BY resource_owner_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY resource_owner_id ORDER BY id DESC) as rn
  FROM oauth_access_grants
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM oauth_access_grants LIMIT 10;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_octobox
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many app installation permissions do we have?
SELECT COUNT(*) FROM app_installation_permissions;

-- 3. [EASY] Show me all of our app installation permissions.
SELECT * FROM app_installation_permissions;

-- 4. [EASY] Can you look up a specific app installation permission?
SELECT * FROM app_installation_permissions WHERE id = ?;

-- 5. [EASY] What app installation permissions were added or changed recently?
SELECT * FROM app_installation_permissions ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different app installation id values we have?
SELECT * FROM app_installation_permissions LIMIT 10;

-- 7. [EASY] How many app installations do we have?
SELECT COUNT(*) FROM app_installation_permissions;

-- 8. [EASY] Show me all of our app installations.
SELECT * FROM app_installation_permissions;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many app installation permissions did we have last month?
SELECT COUNT(*) FROM app_installation_permissions
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many app installation permissions in each?
SELECT app_installation_id, COUNT(*) as count FROM app_installation_permissions GROUP BY app_installation_id;

-- 12. [MEDIUM] Are there any app installation permissions that don't have a match somewhere else?
SELECT * FROM app_installation_permissions LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY account_type ORDER BY id DESC) as rn
  FROM app_installations
) WHERE rn <= 3;

-- 14. [MEDIUM] Show me each app installation along with its related details.
SELECT * FROM app_installation_permissions;

-- 15. [MEDIUM] How many app installations did we have last month?
SELECT COUNT(*) FROM app_installation_permissions
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many app installations in each?
SELECT app_installation_id, COUNT(*) as count FROM app_installation_permissions GROUP BY app_installation_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM app_installation_permissions
LEFT JOIN app_installations ON app_installation_permissions.app_installation_id = app_installations.id
LEFT JOIN users ON app_installation_permissions.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT app_installation_id, COUNT(*) as cnt FROM app_installation_permissions GROUP BY app_installation_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY app_installation_id ORDER BY id DESC) as rn
  FROM app_installation_permissions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM app_installation_permissions LIMIT 10;


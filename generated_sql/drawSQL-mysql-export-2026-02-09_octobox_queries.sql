-- SQLite queries for: drawSQL-mysql-export-2026-02-09_octobox
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many app installation permissions do we have in total?
SELECT COUNT(*) FROM app_installation_permissions;

-- 3. [EASY] Show me all of our app installation permissions.
SELECT * FROM app_installation_permissions;

-- 4. [EASY] Can you look up the app installation permission with id=num?
SELECT * FROM app_installation_permissions WHERE id = num;

-- 5. [EASY] How many app installation permissions were created since created_at=date?
SELECT COUNT(*) FROM app_installation_permissions
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent app installation permissions ordered by app_installation_id?
SELECT * FROM app_installation_permissions ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many app installations do we have in total?
SELECT COUNT(*) FROM app_installations;

-- 8. [EASY] Show me all of our app installations.
SELECT * FROM app_installations;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many app installation permissions were added since created_at=date?
SELECT COUNT(*) FROM app_installation_permissions
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the app installation permissions by app_installation_id — how many in each?
SELECT app_installation_id, COUNT(*) as count FROM app_installation_permissions GROUP BY app_installation_id;

-- 12. [MEDIUM] Are there any app installation permissions that don't have a match in related tables?
SELECT * FROM app_installation_permissions LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 app installation permissions?
SELECT * FROM app_installation_permissions ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of app installation permissions change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM app_installation_permissions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which app installation permissions have duplicate or repeated values?
WITH grouped AS (
  SELECT app_installation_id, COUNT(*) as cnt FROM app_installation_permissions GROUP BY app_installation_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each app installation along with its related details from other tables.
SELECT * FROM app_installation_permissions;

-- 17. [HARD] Pull together a report on app installation permissions joining all related tables.
SELECT * FROM app_installation_permissions
LEFT JOIN app_installations ON app_installation_permissions.app_installation_id = app_installations.id
LEFT JOIN users ON app_installation_permissions.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of app installation permissions?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY app_installation_id ORDER BY id DESC) as rn
  FROM app_installation_permissions
) WHERE rn = num;

-- 19. [HARD] Which app installation permissions are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM app_installation_permissions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group app installation permissions, filter, then rank the results.
WITH grouped AS (
  SELECT app_installation_id, COUNT(*) as cnt FROM app_installation_permissions GROUP BY app_installation_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of app installation permissions over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM app_installation_permissions
ORDER BY created_at;

-- 22. [HARD] Find app installation permissions that exist in one table but not in a related table.
SELECT * FROM app_installation_permissions LIMIT num;

-- 23. [HARD] Combine data from app_installation_permissions, app_installations, and comments in a single report.
SELECT * FROM app_installation_permissions
LEFT JOIN app_installations ON app_installations.id = app_installation_permissions.app_installation_id
LEFT JOIN comments ON comments.id = app_installation_permissions.id;

-- 24. [HARD] Rank all app installation permissions within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM app_installation_permissions;


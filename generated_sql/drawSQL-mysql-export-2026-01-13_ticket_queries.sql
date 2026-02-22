-- SQLite queries for: drawSQL-mysql-export-2026-01-13_ticket
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets have status=num indicating open?
SELECT * FROM permissions LIMIT num;

-- 2. [EASY] Which tickets were created since created_at=date?
SELECT * FROM permissions LIMIT num;

-- 3. [EASY] How many permissions do we have in total?
SELECT COUNT(*) FROM permissions;

-- 4. [EASY] Show me all of our permissions.
SELECT * FROM permissions;

-- 5. [EASY] Can you look up the permission with id=num?
SELECT * FROM permissions WHERE id = num;

-- 6. [EASY] Find the permission where name=string.
SELECT * FROM permissions WHERE name = string;

-- 7. [EASY] How many permissions were created since created_at=date?
SELECT COUNT(*) FROM permissions
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent permissions ordered by name?
SELECT * FROM permissions ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] What's the average resolution time for tickets?
SELECT * FROM permissions LIMIT num;

-- 10. [MEDIUM] Show me each permission along with its related details from other tables.
SELECT t.*, c.*
FROM permissions t
LEFT JOIN model_has_permissions c ON c.permission_id = t.id;

-- 11. [MEDIUM] How many permissions were added since created_at=date?
SELECT COUNT(*) FROM permissions
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the permissions by name — how many in each?
SELECT name, COUNT(*) as count FROM permissions GROUP BY name;

-- 13. [MEDIUM] Are there any permissions that don't have a match in related tables?
SELECT * FROM permissions
WHERE id NOT IN (SELECT DISTINCT permission_id FROM model_has_permissions WHERE permission_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 permissions?
SELECT * FROM permissions ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of permissions change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM permissions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which permissions have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM permissions GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on permissions joining all related tables.
SELECT * FROM model_has_roles
LEFT JOIN roles ON model_has_roles.role_id = roles.id;

-- 18. [HARD] Who or what is the best in each group of permissions?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM permissions
) WHERE rn = num;

-- 19. [HARD] Which permissions are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM permissions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group permissions, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM permissions GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of permissions over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM permissions
ORDER BY created_at;

-- 22. [HARD] Find permissions that exist in one table but not in a related table.
SELECT * FROM permissions
WHERE id NOT IN (SELECT DISTINCT permission_id FROM model_has_permissions WHERE permission_id IS NOT NULL);

-- 23. [HARD] Combine data from permissions, roles, and model_has_permissions in a single report.
SELECT * FROM permissions
LEFT JOIN roles ON roles.id = permissions.role_id
LEFT JOIN model_has_permissions ON model_has_permissions.id = permissions.permission_id;

-- 24. [HARD] Rank all permissions within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM permissions;


-- SQLite queries for: drawSQL-mysql-export-2026-01-13_ticket
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets are still open?
SELECT * FROM permissions LIMIT 10;

-- 2. [EASY] Which tickets were created this week?
SELECT * FROM permissions LIMIT 10;

-- 3. [EASY] How many permissions do we have?
SELECT COUNT(*) FROM permissions;

-- 4. [EASY] Show me all of our permissions.
SELECT * FROM permissions;

-- 5. [EASY] Can you look up a specific permission?
SELECT * FROM permissions WHERE id = ?;

-- 6. [EASY] Find the permission with a certain name or email.
SELECT * FROM permissions WHERE name = ?;

-- 7. [EASY] What permissions were added or changed recently?
SELECT * FROM permissions ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different name values we have?
SELECT * FROM permissions LIMIT 10;

-- 9. [MEDIUM] How long does it take us to resolve tickets on average?
SELECT * FROM permissions LIMIT 10;

-- 10. [MEDIUM] Show me each permission along with its related details.
SELECT t.*, c.*
FROM permissions t
LEFT JOIN model_has_permissions c ON c.permission_id = t.id;

-- 11. [MEDIUM] How many permissions did we have last month?
SELECT COUNT(*) FROM permissions
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many permissions in each?
SELECT name, COUNT(*) as count FROM permissions GROUP BY name;

-- 13. [MEDIUM] Are there any permissions that don't have a match somewhere else?
SELECT * FROM permissions
WHERE id NOT IN (SELECT DISTINCT permission_id FROM model_has_permissions WHERE permission_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY model_type ORDER BY id DESC) as rn
  FROM model_has_permissions
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each role along with its related details.
SELECT t.*, c.*
FROM permissions t
LEFT JOIN model_has_permissions c ON c.permission_id = t.id;

-- 16. [MEDIUM] How many roles did we have last month?
SELECT COUNT(*) FROM permissions
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM model_has_roles
LEFT JOIN roles ON model_has_roles.role_id = roles.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM permissions GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM permissions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM permissions LIMIT 10;


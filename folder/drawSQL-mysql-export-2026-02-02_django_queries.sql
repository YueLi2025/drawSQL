-- SQLite queries for: drawSQL-mysql-export-2026-02-02_django
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM auth_group;

-- 2. [EASY] How many auth group do we have?
SELECT COUNT(*) FROM auth_group;

-- 3. [EASY] Show me all of our auth group.
SELECT * FROM auth_group;

-- 4. [EASY] Can you look up a specific auth group?
SELECT * FROM auth_group WHERE id = ?;

-- 5. [EASY] Find the auth group with a certain name or email.
SELECT * FROM auth_group WHERE name = ?;

-- 6. [EASY] What are the different name values we have?
SELECT * FROM auth_group LIMIT 10;

-- 7. [EASY] How many auth group permissions do we have?
SELECT COUNT(*) FROM auth_group;

-- 8. [EASY] Show me all of our auth group permissions.
SELECT * FROM auth_group;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM auth_group LIMIT 10;

-- 10. [MEDIUM] Show me each auth group along with its related details.
SELECT t.*, c.*
FROM auth_group t
LEFT JOIN auth_group_permissions c ON c.group_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many auth group in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 12. [MEDIUM] Are there any auth group that don't have a match somewhere else?
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM auth_group_permissions WHERE group_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY id DESC) as rn
  FROM auth_group_permissions
) WHERE rn <= 3;

-- 14. [MEDIUM] Break it down by type or category—how many auth group permissions in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 15. [MEDIUM] Are there any auth group permissions that don't have a match somewhere else?
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM auth_group_permissions WHERE group_id IS NOT NULL);

-- 16. [MEDIUM] Show me each auth permission along with its related details.
SELECT t.*, c.*
FROM auth_group t
LEFT JOIN auth_group_permissions c ON c.group_id = t.id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM auth_group_permissions
LEFT JOIN auth_group ON auth_group_permissions.group_id = auth_group.id
LEFT JOIN auth_permission ON auth_group_permissions.permission_id = auth_permission.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM auth_group GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM auth_group
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM auth_group LIMIT 10;


-- SQLite queries for: drawSQL-mysql-export-2026-02-02_django
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many auth group do we have in total?
SELECT COUNT(*) FROM auth_group;

-- 3. [EASY] Show me all of our auth group.
SELECT * FROM auth_group;

-- 4. [EASY] Can you look up the auth group with id=num?
SELECT * FROM auth_group WHERE id = num;

-- 5. [EASY] Find the auth group where name=string.
SELECT * FROM auth_group WHERE name = string;

-- 6. [EASY] What are the most recent auth group ordered by name?
SELECT * FROM auth_group ORDER BY name DESC LIMIT num;

-- 7. [EASY] How many auth group permissions do we have in total?
SELECT COUNT(*) FROM auth_group;

-- 8. [EASY] Show me all of our auth group permissions.
SELECT * FROM auth_group;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each auth group along with its related details from other tables.
SELECT t.*, c.*
FROM auth_group t
LEFT JOIN auth_group_permissions c ON c.group_id = t.id;

-- 11. [MEDIUM] Break down the auth group by name — how many in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 12. [MEDIUM] Are there any auth group that don't have a match in related tables?
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM auth_group_permissions WHERE group_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 auth group?
SELECT * FROM auth_group ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] Which auth group have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM auth_group GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 15. [MEDIUM] Break down the auth group permissions by group_id — how many in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 16. [MEDIUM] Are there any auth group permissions that don't have a match in related tables?
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM auth_group_permissions WHERE group_id IS NOT NULL);

-- 17. [HARD] Pull together a report on auth group joining all related tables.
SELECT * FROM auth_group_permissions
LEFT JOIN auth_group ON auth_group_permissions.group_id = auth_group.id
LEFT JOIN auth_permission ON auth_group_permissions.permission_id = auth_permission.id;

-- 18. [HARD] Who or what is the best in each group of auth group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM auth_group
) WHERE rn = num;

-- 19. [HARD] Which auth group are above average compared to others in their group?
SELECT * FROM auth_group LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group auth group, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM auth_group GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find auth group that exist in one table but not in a related table.
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM auth_group_permissions WHERE group_id IS NOT NULL);

-- 22. [HARD] Combine data from auth_group, auth_group_permissions, and auth_permission in a single report.
SELECT * FROM auth_group
LEFT JOIN auth_group_permissions ON auth_group_permissions.id = auth_group.group_id
LEFT JOIN auth_permission ON auth_permission.id = auth_group.group_id;

-- 23. [HARD] Rank all auth group within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM auth_group;

-- 24. [HARD] Pull together a report on auth group permissions joining all related tables.
SELECT * FROM auth_group_permissions
LEFT JOIN auth_group ON auth_group_permissions.group_id = auth_group.id
LEFT JOIN auth_permission ON auth_group_permissions.permission_id = auth_permission.id;


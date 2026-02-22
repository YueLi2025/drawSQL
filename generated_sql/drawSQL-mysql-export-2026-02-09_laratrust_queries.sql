-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laratrust
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many permission role do we have in total?
SELECT COUNT(*) FROM permission_role;

-- 3. [EASY] Show me all of our permission role.
SELECT * FROM permission_role;

-- 4. [EASY] Can you look up the permission role with id=num?
SELECT * FROM permission_role LIMIT num;

-- 5. [EASY] What are the most recent permission role ordered by permission_id?
SELECT * FROM permission_role ORDER BY role_id DESC LIMIT num;

-- 6. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 7. [EASY] Show me all of our users.
SELECT * FROM users;

-- 8. [EASY] Can you look up the user with id=num?
SELECT * FROM permissions WHERE id = num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Break down the permission role by permission_id — how many in each?
SELECT permission_id, COUNT(*) as count FROM permission_role GROUP BY permission_id;

-- 11. [MEDIUM] Are there any permission role that don't have a match in related tables?
SELECT * FROM permission_role LIMIT num;

-- 12. [MEDIUM] For each group, what are the top 3 permission role?
SELECT * FROM permission_role ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which permission role have duplicate or repeated values?
WITH grouped AS (
  SELECT permission_id, COUNT(*) as cnt FROM permission_role GROUP BY permission_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Break down the users by user_type — how many in each?
SELECT COUNT(*) FROM users;

-- 15. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM permission_user WHERE user_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 17. [HARD] Pull together a report on permission role joining all related tables.
SELECT * FROM permission_role
LEFT JOIN permissions ON permission_role.permission_id = permissions.id;

-- 18. [HARD] Who or what is the best in each group of permission role?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY role_id ORDER BY id DESC) as rn
  FROM permission_role
) WHERE rn = num;

-- 19. [HARD] Which permission role are above average compared to others in their group?
SELECT * FROM permission_role LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group permission role, filter, then rank the results.
WITH grouped AS (
  SELECT role_id, COUNT(*) as cnt FROM permission_role GROUP BY role_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find permission role that exist in one table but not in a related table.
SELECT * FROM permission_role LIMIT num;

-- 22. [HARD] Combine data from permission_role, permission_user, and permissions in a single report.
SELECT * FROM permission_role
LEFT JOIN permission_user ON permission_user.id = permission_role.id
LEFT JOIN permissions ON permissions.id = permission_role.permission_id;

-- 23. [HARD] Rank all permission role within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM permission_role;

-- 24. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM permission_role
LEFT JOIN permissions ON permission_role.permission_id = permissions.id;


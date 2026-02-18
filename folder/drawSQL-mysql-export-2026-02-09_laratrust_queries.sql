-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laratrust
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many permission role do we have?
SELECT COUNT(*) FROM permission_role;

-- 3. [EASY] Show me all of our permission role.
SELECT * FROM permission_role;

-- 4. [EASY] Can you look up a specific permission role?
SELECT * FROM permissions WHERE id = ?;

-- 5. [EASY] What are the different permission id values we have?
SELECT * FROM permission_role LIMIT 10;

-- 6. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 7. [EASY] Show me all of our users.
SELECT * FROM users;

-- 8. [EASY] Can you look up a specific user?
SELECT * FROM permissions WHERE id = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many permission role in each?
SELECT permission_id, COUNT(*) as count FROM permission_role GROUP BY permission_id;

-- 11. [MEDIUM] Are there any permission role that don't have a match somewhere else?
SELECT * FROM permission_role LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM permission_user
) WHERE rn <= 3;

-- 13. [MEDIUM] Break it down by type or category—how many users in each?
SELECT id, COUNT(*) as count FROM users GROUP BY id;

-- 14. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM permission_user WHERE user_id IS NOT NULL);

-- 15. [MEDIUM] Show me each permission along with its related details.
SELECT * FROM permission_role;

-- 16. [MEDIUM] How many permissions did we have last month?
SELECT COUNT(*) FROM permissions
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM permission_role
LEFT JOIN permissions ON permission_role.permission_id = permissions.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT role_id, COUNT(*) as cnt FROM permission_role GROUP BY role_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY role_id ORDER BY id DESC) as rn
  FROM permission_role
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM permission_role LIMIT 10;


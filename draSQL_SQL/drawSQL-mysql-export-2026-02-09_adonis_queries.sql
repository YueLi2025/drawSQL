-- SQLite queries for: drawSQL-mysql-export-2026-02-09_adonis
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM role_user WHERE id = ?;

-- 5. [EASY] What users were added or changed recently?
SELECT * FROM users LIMIT 10;

-- 6. [EASY] What are the different role id values we have?
SELECT * FROM role_user LIMIT 10;

-- 7. [EASY] How many roles do we have?
SELECT COUNT(*) FROM role_user;

-- 8. [EASY] Show me all of our roles.
SELECT * FROM role_user;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users;

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT id, COUNT(*) as count FROM users GROUP BY id;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM role_user WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM role_user LIMIT 10;

-- 14. [MEDIUM] Show me each role along with its related details.
SELECT * FROM role_user;

-- 15. [MEDIUM] How many roles did we have last month?
SELECT COUNT(*) FROM role_user
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many roles in each?
SELECT role_id, COUNT(*) as count FROM role_user GROUP BY role_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM permission_role
LEFT JOIN permissions ON permission_role.permission_id = permissions.id
LEFT JOIN roles ON permission_role.permission_id = roles.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT role_id, COUNT(*) as cnt FROM role_user GROUP BY role_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY role_id ORDER BY id DESC) as rn
  FROM role_user
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM role_user LIMIT 10;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_defender
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many roles do we have?
SELECT COUNT(*) FROM roles;

-- 3. [EASY] Show me all of our roles.
SELECT * FROM roles;

-- 4. [EASY] Can you look up a specific role?
SELECT * FROM roles WHERE id = ?;

-- 5. [EASY] Find the role with a certain name or email.
SELECT * FROM roles WHERE name = ?;

-- 6. [EASY] What roles were added or changed recently?
SELECT * FROM roles ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM roles LIMIT 10;

-- 8. [EASY] How many permissions do we have?
SELECT COUNT(*) FROM roles;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each role along with its related details.
SELECT t.*, c.*
FROM roles t
LEFT JOIN role_user c ON c.role_id = t.id;

-- 11. [MEDIUM] How many roles did we have last month?
SELECT COUNT(*) FROM roles
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many roles in each?
SELECT name, COUNT(*) as count FROM roles GROUP BY name;

-- 13. [MEDIUM] Are there any roles that don't have a match somewhere else?
SELECT * FROM roles
WHERE id NOT IN (SELECT DISTINCT role_id FROM role_user WHERE role_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM roles LIMIT 10;

-- 15. [MEDIUM] Show me each permission along with its related details.
SELECT t.*, c.*
FROM roles t
LEFT JOIN role_user c ON c.role_id = t.id;

-- 16. [MEDIUM] How many permissions did we have last month?
SELECT COUNT(*) FROM roles
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM role_user
LEFT JOIN roles ON role_user.role_id = roles.id
LEFT JOIN users ON role_user.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM roles GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM roles
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM permission_role
WHERE value > (SELECT AVG(value) FROM permission_role);


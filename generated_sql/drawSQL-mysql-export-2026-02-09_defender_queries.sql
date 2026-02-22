-- SQLite queries for: drawSQL-mysql-export-2026-02-09_defender
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many roles do we have in total?
SELECT COUNT(*) FROM roles;

-- 3. [EASY] Show me all of our roles.
SELECT * FROM roles;

-- 4. [EASY] Can you look up the role with id=num?
SELECT * FROM roles WHERE id = num;

-- 5. [EASY] Find the role where name=string.
SELECT * FROM roles WHERE name = string;

-- 6. [EASY] How many roles were created since created_at=date?
SELECT COUNT(*) FROM roles
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent roles ordered by name?
SELECT * FROM roles ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many permissions do we have in total?
SELECT COUNT(*) FROM permissions;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each role along with its related details from other tables.
SELECT t.*, c.*
FROM roles t
LEFT JOIN role_user c ON c.role_id = t.id;

-- 11. [MEDIUM] How many roles were added since created_at=date?
SELECT COUNT(*) FROM roles
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the roles by name — how many in each?
SELECT name, COUNT(*) as count FROM roles GROUP BY name;

-- 13. [MEDIUM] Are there any roles that don't have a match in related tables?
SELECT * FROM roles
WHERE id NOT IN (SELECT DISTINCT role_id FROM role_user WHERE role_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 roles?
SELECT * FROM roles ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of roles change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM roles
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which roles have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM roles GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on roles joining all related tables.
SELECT * FROM role_user
LEFT JOIN roles ON role_user.role_id = roles.id
LEFT JOIN users ON role_user.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of roles?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM roles
) WHERE rn = num;

-- 19. [HARD] Which roles are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM roles
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group roles, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM roles GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of roles over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM roles
ORDER BY created_at;

-- 22. [HARD] Find roles that exist in one table but not in a related table.
SELECT * FROM roles
WHERE id NOT IN (SELECT DISTINCT role_id FROM role_user WHERE role_id IS NOT NULL);

-- 23. [HARD] Combine data from roles, permissions, and role_user in a single report.
SELECT * FROM roles
LEFT JOIN permissions ON permissions.id = roles.role_id
LEFT JOIN role_user ON role_user.id = roles.role_id;

-- 24. [HARD] Rank all roles within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM roles;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_adonis
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM role_user WHERE id = num;

-- 5. [EASY] How many users were created since created_at=date?
SELECT COUNT(*) FROM users;

-- 6. [EASY] What are the most recent users ordered by role_id?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 7. [EASY] How many roles do we have in total?
SELECT COUNT(*) FROM roles;

-- 8. [EASY] Show me all of our roles.
SELECT * FROM roles;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users;

-- 11. [MEDIUM] Break down the users by role_id — how many in each?
SELECT COUNT(*) FROM users;

-- 12. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM role_user WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of users change month over month?
SELECT * FROM users LIMIT num;

-- 15. [MEDIUM] Which users have duplicate or repeated values?
SELECT * FROM users LIMIT num;

-- 16. [MEDIUM] Show me each role along with its related details from other tables.
SELECT * FROM role_user;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM permission_role
LEFT JOIN permissions ON permission_role.permission_id = permissions.id
LEFT JOIN roles ON permission_role.permission_id = roles.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY role_id ORDER BY id DESC) as rn
  FROM role_user
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT * FROM users LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT role_id, COUNT(*) as cnt FROM role_user GROUP BY role_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on created_at.
SELECT * FROM users LIMIT num;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM role_user WHERE user_id IS NOT NULL);

-- 23. [HARD] Combine data from role_user, roles, and permissions in a single report.
SELECT * FROM role_user
LEFT JOIN roles ON roles.id = role_user.role_id
LEFT JOIN permissions ON permissions.id = role_user.permission_id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;


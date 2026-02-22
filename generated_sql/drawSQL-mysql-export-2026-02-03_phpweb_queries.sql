-- SQLite queries for: drawSQL-mysql-export-2026-02-03_phpweb
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM users WHERE id = num;

-- 5. [EASY] Find the user where name=string.
SELECT * FROM users WHERE name = string;

-- 6. [EASY] How many users were created since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent users ordered by name?
SELECT * FROM users ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] Show me the first few users from the users table.
SELECT * FROM users LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the users by name — how many in each?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM users GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Are there any records that exist in one table but not in a related one?
SELECT * FROM users LIMIT num;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM users;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM users
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM users GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM users
ORDER BY created_at;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users LIMIT num;

-- 23. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;

-- 24. [HARD] Build a comprehensive report pulling data from multiple tables.
SELECT * FROM users;


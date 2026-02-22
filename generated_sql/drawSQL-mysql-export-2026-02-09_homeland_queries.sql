-- SQLite queries for: drawSQL-mysql-export-2026-02-09_homeland
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT team_id, COUNT(*) as member_count FROM team_users GROUP BY team_id;

-- 3. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 4. [EASY] Show me all of our users.
SELECT * FROM users;

-- 5. [EASY] Can you look up the user with id=num?
SELECT * FROM users WHERE id = num;

-- 6. [EASY] Find the user where name=string.
SELECT * FROM users WHERE name = string;

-- 7. [EASY] How many users were created since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent users ordered by login?
SELECT * FROM users ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM users t
LEFT JOIN users c ON c.id = t.location_id;

-- 11. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the users by login — how many in each?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users LIMIT num;

-- 14. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT login, COUNT(*) as cnt FROM users GROUP BY login
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM users
LEFT JOIN users ON users.id = users.location_id
LEFT JOIN topics ON users.id = topics.user_id
LEFT JOIN notes ON users.id = notes.user_id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY login ORDER BY id DESC) as rn
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
  SELECT login, COUNT(*) as cnt FROM users GROUP BY login
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM users
ORDER BY created_at;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users LIMIT num;

-- 23. [HARD] Combine data from users, user_ssos, and topics in a single report.
SELECT * FROM users
LEFT JOIN user_ssos ON user_ssos.location_id = users.id
LEFT JOIN topics ON topics.location_id = users.id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;


-- SQLite queries for: drawSQL-mysql-export-2026-02-03_phpweb
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM users WHERE id = ?;

-- 5. [EASY] Find the user with a certain name or email.
SELECT * FROM users WHERE name = ?;

-- 6. [EASY] What users were added or changed recently?
SELECT * FROM users ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM users LIMIT 10;

-- 8. [EASY] Give me a list of all users.
SELECT * FROM users;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT name, COUNT(*) as count FROM users GROUP BY name;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM users LIMIT 10;

-- 14. [MEDIUM] Are there any that exist in one list but not the other?
SELECT * FROM users LIMIT 10;

-- 15. [MEDIUM] How did the numbers change compared to last month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] What are the top few in each category?
SELECT * FROM users LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM users;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM users GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM users
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM users LIMIT 10;


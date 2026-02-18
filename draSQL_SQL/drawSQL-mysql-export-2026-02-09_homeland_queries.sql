-- SQLite queries for: drawSQL-mysql-export-2026-02-09_homeland
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM users LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM users LIMIT 10;

-- 4. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 5. [EASY] Show me all of our users.
SELECT * FROM users;

-- 6. [EASY] Can you look up a specific user?
SELECT * FROM users WHERE id = ?;

-- 7. [EASY] Find the user with a certain name or email.
SELECT * FROM users WHERE name = ?;

-- 8. [EASY] What users were added or changed recently?
SELECT * FROM users ORDER BY created_at DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN users c ON c.id = t.location_id;

-- 11. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many users in each?
SELECT login, COUNT(*) as count FROM users GROUP BY login;

-- 13. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM users LIMIT 10;

-- 15. [MEDIUM] Show me each topic along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN users c ON c.id = t.location_id;

-- 16. [MEDIUM] How many topics did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM users
LEFT JOIN users ON users.id = users.location_id
LEFT JOIN topics ON users.id = topics.user_id
LEFT JOIN notes ON users.id = notes.user_id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT login, COUNT(*) as cnt FROM users GROUP BY login
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY login ORDER BY id DESC) as rn
  FROM users
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM settings t1
WHERE value > (
  SELECT AVG(value) FROM settings t2 WHERE t2.thing_type = t1.thing_type
);


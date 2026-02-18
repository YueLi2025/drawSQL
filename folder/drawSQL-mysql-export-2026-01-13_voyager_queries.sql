-- SQLite queries for: drawSQL-mysql-export-2026-01-13_voyager
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM users WHERE id = ?;

-- 5. [EASY] What are the different avatar values we have?
SELECT * FROM users LIMIT 10;

-- 6. [EASY] How many data types do we have?
SELECT COUNT(*) FROM users;

-- 7. [EASY] Show me all of our data types.
SELECT * FROM users;

-- 8. [EASY] Can you look up a specific data type?
SELECT * FROM users WHERE id = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN user_roles c ON c.user_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT avatar, COUNT(*) as count FROM users GROUP BY avatar;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM user_roles WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM users LIMIT 10;

-- 14. [MEDIUM] Show me each data type along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN user_roles c ON c.user_id = t.id;

-- 15. [MEDIUM] How many data types did we have last month?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many data types in each?
SELECT avatar, COUNT(*) as count FROM users GROUP BY avatar;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM menu_items
LEFT JOIN menu_items ON menu_items.parent_id = menu_items.id
LEFT JOIN menus ON menu_items.menu_id = menus.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT avatar, COUNT(*) as cnt FROM users GROUP BY avatar
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY avatar ORDER BY id DESC) as rn
  FROM users
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM settings t1
WHERE value > (
  SELECT AVG(value) FROM settings t2 WHERE t2.type = t1.type
);


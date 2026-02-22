-- SQLite queries for: drawSQL-mysql-export-2026-01-13_voyager
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM users WHERE id = num;

-- 5. [EASY] How many users were created since avatar=date?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 6. [EASY] What are the most recent users ordered by avatar?
SELECT * FROM users ORDER BY avatar DESC LIMIT num;

-- 7. [EASY] How many data types do we have in total?
SELECT COUNT(*) FROM data_types;

-- 8. [EASY] Show me all of our data types.
SELECT * FROM data_types;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM users t
LEFT JOIN user_roles c ON c.user_id = t.id;

-- 11. [MEDIUM] How many users were added since avatar=date?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the users by avatar — how many in each?
SELECT COUNT(*) FROM users
WHERE avatar >= date('now', '-1 month');

-- 13. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM user_roles WHERE user_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', avatar) as period,
  COUNT(*) as count
FROM users
WHERE avatar >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT avatar, COUNT(*) as cnt FROM users GROUP BY avatar
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM menu_items
LEFT JOIN menu_items ON menu_items.parent_id = menu_items.id
LEFT JOIN menus ON menu_items.menu_id = menus.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY avatar ORDER BY id DESC) as rn
  FROM users
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', avatar) as period,
  COUNT(*) as count
FROM users
WHERE avatar >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT avatar, COUNT(*) as cnt FROM users GROUP BY avatar
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on avatar.
SELECT *, COUNT(*) OVER (ORDER BY avatar) as running_count
FROM users
ORDER BY avatar;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM user_roles WHERE user_id IS NOT NULL);

-- 23. [HARD] Combine data from users, data_types, and menus in a single report.
SELECT * FROM users
LEFT JOIN data_types ON data_types.id = users.user_id
LEFT JOIN menus ON menus.id = users.user_id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;


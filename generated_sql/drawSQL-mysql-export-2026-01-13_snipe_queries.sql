-- SQLite queries for: drawSQL-mysql-export-2026-01-13_snipe
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many accessories do we have in total?
SELECT COUNT(*) FROM accessories;

-- 3. [EASY] Show me all of our accessories.
SELECT * FROM accessories;

-- 4. [EASY] Can you look up the accessory with id=num?
SELECT * FROM accessories WHERE id = num;

-- 5. [EASY] Find the accessory where name=string.
SELECT * FROM accessories WHERE name = string;

-- 6. [EASY] How many accessories were created since created_at=date?
SELECT COUNT(*) FROM accessories
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent accessories ordered by name?
SELECT * FROM accessories ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each accessory along with its related details from other tables.
SELECT t.*, c.*
FROM accessories t
LEFT JOIN accessories_users c ON c.accessory_id = t.id;

-- 11. [MEDIUM] How many accessories were added since created_at=date?
SELECT COUNT(*) FROM accessories
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the accessories by category_id — how many in each?
SELECT category_id, COUNT(*) as count FROM accessories GROUP BY category_id;

-- 13. [MEDIUM] Are there any accessories that don't have a match in related tables?
SELECT * FROM accessories
WHERE id NOT IN (SELECT DISTINCT accessory_id FROM accessories_users WHERE accessory_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 accessories?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id DESC) as rn
  FROM components
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of accessories change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM accessories
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which accessories have duplicate or repeated values?
WITH grouped AS (
  SELECT category_id, COUNT(*) as cnt FROM accessories GROUP BY category_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on accessories joining all related tables.
SELECT * FROM accessories
LEFT JOIN users ON accessories.user_id = users.id
LEFT JOIN categories ON accessories.category_id = categories.id;

-- 18. [HARD] Who or what is the best in each group of accessories?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id DESC) as rn
  FROM accessories
) WHERE rn = num;

-- 19. [HARD] Which accessories are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM accessories
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group accessories, filter, then rank the results.
WITH grouped AS (
  SELECT category_id, COUNT(*) as cnt FROM accessories GROUP BY category_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of accessories over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM accessories
ORDER BY created_at;

-- 22. [HARD] Find accessories that exist in one table but not in a related table.
SELECT * FROM accessories
WHERE id NOT IN (SELECT DISTINCT accessory_id FROM accessories_users WHERE accessory_id IS NOT NULL);

-- 23. [HARD] Combine data from accessories, accessories_users, and action_logs in a single report.
SELECT * FROM accessories
LEFT JOIN accessories_users ON accessories_users.id = accessories.accessory_id
LEFT JOIN action_logs ON action_logs.id = accessories.accessory_id
LEFT JOIN users ON users.id = accessories.user_id;

-- 24. [HARD] Rank all accessories within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id DESC) as rn
  FROM accessories
) WHERE rn <= num;


-- SQLite queries for: drawSQL-mysql-export-2026-01-13_snipe
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many accessories do we have?
SELECT COUNT(*) FROM accessories;

-- 3. [EASY] Show me all of our accessories.
SELECT * FROM accessories;

-- 4. [EASY] Can you look up a specific accessory?
SELECT * FROM accessories WHERE id = ?;

-- 5. [EASY] Find the accessory with a certain name or email.
SELECT * FROM accessories WHERE name = ?;

-- 6. [EASY] What accessories were added or changed recently?
SELECT * FROM accessories ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM accessories LIMIT 10;

-- 8. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each accessory along with its related details.
SELECT t.*, c.*
FROM accessories t
LEFT JOIN accessories_users c ON c.accessory_id = t.id;

-- 11. [MEDIUM] How many accessories did we have last month?
SELECT COUNT(*) FROM accessories
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many accessories in each?
SELECT category_id, COUNT(*) as count FROM accessories GROUP BY category_id;

-- 13. [MEDIUM] Are there any accessories that don't have a match somewhere else?
SELECT * FROM accessories
WHERE id NOT IN (SELECT DISTINCT accessory_id FROM accessories_users WHERE accessory_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id DESC) as rn
  FROM components
) WHERE rn <= 3;

-- 15. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many users in each?
SELECT email, COUNT(*) as count FROM users GROUP BY email;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM accessories
LEFT JOIN users ON accessories.user_id = users.id
LEFT JOIN categories ON accessories.category_id = categories.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT category_id, COUNT(*) as cnt FROM accessories GROUP BY category_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY id DESC) as rn
  FROM accessories
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM checkout_requests t1
WHERE quantity > (
  SELECT AVG(quantity) FROM checkout_requests t2 WHERE t2.requestable_type = t1.requestable_type
);


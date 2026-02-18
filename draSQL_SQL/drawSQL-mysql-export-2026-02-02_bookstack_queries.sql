-- SQLite queries for: drawSQL-mysql-export-2026-02-02_bookstack
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activities do we have?
SELECT COUNT(*) FROM activities;

-- 3. [EASY] Show me all of our activities.
SELECT * FROM activities;

-- 4. [EASY] Can you look up a specific activity?
SELECT * FROM activities WHERE id = ?;

-- 5. [EASY] What activities were added or changed recently?
SELECT * FROM activities ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different extra values we have?
SELECT * FROM activities LIMIT 10;

-- 7. [EASY] How many api tokens do we have?
SELECT COUNT(*) FROM activities;

-- 8. [EASY] Show me all of our api tokens.
SELECT * FROM activities;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many activities did we have last month?
SELECT COUNT(*) FROM activities
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many activities in each?
SELECT entity_type, COUNT(*) as count FROM activities GROUP BY entity_type;

-- 12. [MEDIUM] Are there any activities that don't have a match somewhere else?
SELECT * FROM activities LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM activities
) WHERE rn <= 3;

-- 14. [MEDIUM] How many api tokens did we have last month?
SELECT COUNT(*) FROM activities
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many api tokens in each?
SELECT entity_type, COUNT(*) as count FROM activities GROUP BY entity_type;

-- 16. [MEDIUM] Are there any api tokens that don't have a match somewhere else?
SELECT * FROM activities LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM activities
LEFT JOIN books ON activities.book_id = books.id
LEFT JOIN users ON activities.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM activities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM activities
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM settings
WHERE value > (SELECT AVG(value) FROM settings);


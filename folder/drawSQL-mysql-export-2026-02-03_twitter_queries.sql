-- SQLite queries for: drawSQL-mysql-export-2026-02-03_twitter
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many relationships do we have?
SELECT COUNT(*) FROM relationships;

-- 3. [EASY] Show me all of our relationships.
SELECT * FROM relationships;

-- 4. [EASY] Can you look up a specific relationship?
SELECT * FROM relationships WHERE id = ?;

-- 5. [EASY] What relationships were added or changed recently?
SELECT * FROM relationships ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different follower id values we have?
SELECT * FROM relationships LIMIT 10;

-- 7. [EASY] How many tweets do we have?
SELECT COUNT(*) FROM relationships;

-- 8. [EASY] Show me all of our tweets.
SELECT * FROM relationships;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many relationships did we have last month?
SELECT COUNT(*) FROM relationships
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many relationships in each?
SELECT follower_id, COUNT(*) as count FROM relationships GROUP BY follower_id;

-- 12. [MEDIUM] Are there any relationships that don't have a match somewhere else?
SELECT * FROM relationships LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM relationships LIMIT 10;

-- 14. [MEDIUM] How many tweets did we have last month?
SELECT COUNT(*) FROM relationships
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many tweets in each?
SELECT follower_id, COUNT(*) as count FROM relationships GROUP BY follower_id;

-- 16. [MEDIUM] Are there any tweets that don't have a match somewhere else?
SELECT * FROM relationships LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM relationships
LEFT JOIN users ON relationships.follower_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT follower_id, COUNT(*) as cnt FROM relationships GROUP BY follower_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY follower_id ORDER BY id DESC) as rn
  FROM relationships
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM relationships LIMIT 10;


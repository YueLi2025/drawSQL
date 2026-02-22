-- SQLite queries for: drawSQL-mysql-export-2026-02-03_twitter
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many relationships do we have in total?
SELECT COUNT(*) FROM relationships;

-- 3. [EASY] Show me all of our relationships.
SELECT * FROM relationships;

-- 4. [EASY] Can you look up the relationship with id=num?
SELECT * FROM relationships WHERE id = num;

-- 5. [EASY] How many relationships were created since created_at=date?
SELECT COUNT(*) FROM relationships
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent relationships ordered by follower_id?
SELECT * FROM relationships ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many tweets do we have in total?
SELECT COUNT(*) FROM tweets;

-- 8. [EASY] Show me all of our tweets.
SELECT * FROM tweets;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many relationships were added since created_at=date?
SELECT COUNT(*) FROM relationships
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the relationships by follower_id — how many in each?
SELECT follower_id, COUNT(*) as count FROM relationships GROUP BY follower_id;

-- 12. [MEDIUM] Are there any relationships that don't have a match in related tables?
SELECT * FROM relationships LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 relationships?
SELECT * FROM relationships ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of relationships change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM relationships
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which relationships have duplicate or repeated values?
WITH grouped AS (
  SELECT follower_id, COUNT(*) as cnt FROM relationships GROUP BY follower_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many tweets were added since created_at=date?
SELECT COUNT(*) FROM tweets
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on relationships joining all related tables.
SELECT * FROM relationships
LEFT JOIN users ON relationships.follower_id = users.id;

-- 18. [HARD] Who or what is the best in each group of relationships?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY follower_id ORDER BY id DESC) as rn
  FROM relationships
) WHERE rn = num;

-- 19. [HARD] Which relationships are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM relationships
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group relationships, filter, then rank the results.
WITH grouped AS (
  SELECT follower_id, COUNT(*) as cnt FROM relationships GROUP BY follower_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of relationships over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM relationships
ORDER BY created_at;

-- 22. [HARD] Find relationships that exist in one table but not in a related table.
SELECT * FROM relationships LIMIT num;

-- 23. [HARD] Combine data from relationships, tweets, and users in a single report.
SELECT * FROM relationships
LEFT JOIN tweets ON tweets.id = relationships.id
LEFT JOIN users ON users.id = relationships.user_id;

-- 24. [HARD] Rank all relationships within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM relationships;


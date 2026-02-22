-- SQLite queries for: drawSQL-mysql-export-2026-02-02_bookstack
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activities do we have in total?
SELECT COUNT(*) FROM activities;

-- 3. [EASY] Show me all of our activities.
SELECT * FROM activities;

-- 4. [EASY] Can you look up the activity with id=num?
SELECT * FROM activities WHERE id = num;

-- 5. [EASY] How many activities were created since created_at=date?
SELECT COUNT(*) FROM activities
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent activities ordered by extra?
SELECT * FROM activities ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many api tokens do we have in total?
SELECT COUNT(*) FROM api_tokens;

-- 8. [EASY] Show me all of our api tokens.
SELECT * FROM api_tokens;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many activities were added since created_at=date?
SELECT COUNT(*) FROM activities
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the activities by entity_type — how many in each?
SELECT entity_type, COUNT(*) as count FROM activities GROUP BY entity_type;

-- 12. [MEDIUM] Are there any activities that don't have a match in related tables?
SELECT * FROM activities LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 activities?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM activities
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of activities change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activities
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which activities have duplicate or repeated values?
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM activities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many api tokens were added since created_at=date?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on activities joining all related tables.
SELECT * FROM activities
LEFT JOIN books ON activities.book_id = books.id
LEFT JOIN users ON activities.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of activities?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM activities
) WHERE rn = num;

-- 19. [HARD] Which activities are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM activities
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group activities, filter, then rank the results.
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM activities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of activities over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM activities
ORDER BY created_at;

-- 22. [HARD] Find activities that exist in one table but not in a related table.
SELECT * FROM activities LIMIT num;

-- 23. [HARD] Combine data from activities, api_tokens, and attachments in a single report.
SELECT * FROM activities
LEFT JOIN api_tokens ON api_tokens.id = activities.id
LEFT JOIN attachments ON attachments.id = activities.id;

-- 24. [HARD] Rank all activities within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM activities
) WHERE rn <= num;


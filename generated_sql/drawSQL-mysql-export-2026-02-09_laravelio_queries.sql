-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laravelio
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many likes do we have in total?
SELECT COUNT(*) FROM likes;

-- 3. [EASY] Show me all of our likes.
SELECT * FROM likes;

-- 4. [EASY] Can you look up the like with id=num?
SELECT * FROM failed_jobs WHERE id = num;

-- 5. [EASY] How many likes were created since created_at=date?
SELECT COUNT(*) FROM likes
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent likes ordered by user_id?
SELECT * FROM likes ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many notifications do we have in total?
SELECT COUNT(*) FROM notifications;

-- 8. [EASY] Show me all of our notifications.
SELECT * FROM notifications;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many likes were added since created_at=date?
SELECT COUNT(*) FROM likes
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the likes by likeable_type — how many in each?
SELECT likeable_type, COUNT(*) as count FROM likes GROUP BY likeable_type;

-- 12. [MEDIUM] Are there any likes that don't have a match in related tables?
SELECT * FROM likes LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 likes?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY likeable_type ORDER BY id DESC) as rn
  FROM likes
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of likes change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM likes
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which likes have duplicate or repeated values?
WITH grouped AS (
  SELECT likeable_type, COUNT(*) as cnt FROM likes GROUP BY likeable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many notifications were added since created_at=date?
SELECT COUNT(*) FROM notifications
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on likes joining all related tables.
SELECT * FROM likes
LEFT JOIN replies ON likes.likeable_id = replies.id
LEFT JOIN users ON likes.user_id = users.id
LEFT JOIN threads ON likes.likeable_id = threads.id;

-- 18. [HARD] Who or what is the best in each group of likes?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY connection ORDER BY id DESC) as rn
  FROM failed_jobs
) WHERE rn = num;

-- 19. [HARD] Which likes are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM likes
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group likes, filter, then rank the results.
WITH grouped AS (
  SELECT connection, COUNT(*) as cnt FROM failed_jobs GROUP BY connection
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of likes over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM likes
ORDER BY created_at;

-- 22. [HARD] Find likes that exist in one table but not in a related table.
SELECT * FROM likes LIMIT num;

-- 23. [HARD] Combine data from likes, notifications, and password_resets in a single report.
SELECT * FROM likes
LEFT JOIN notifications ON notifications.id = likes.id
LEFT JOIN password_resets ON password_resets.id = likes.id;

-- 24. [HARD] Rank all likes within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY likeable_type ORDER BY id DESC) as rn
  FROM likes
) WHERE rn <= num;


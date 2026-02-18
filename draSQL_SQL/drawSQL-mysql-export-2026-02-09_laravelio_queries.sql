-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laravelio
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many likes do we have?
SELECT COUNT(*) FROM failed_jobs;

-- 3. [EASY] Show me all of our likes.
SELECT * FROM failed_jobs;

-- 4. [EASY] Can you look up a specific like?
SELECT * FROM failed_jobs WHERE id = ?;

-- 5. [EASY] What likes were added or changed recently?
SELECT * FROM failed_jobs ORDER BY failed_at DESC LIMIT 50;

-- 6. [EASY] What are the different user id values we have?
SELECT * FROM failed_jobs LIMIT 10;

-- 7. [EASY] How many notifications do we have?
SELECT COUNT(*) FROM failed_jobs;

-- 8. [EASY] Show me all of our notifications.
SELECT * FROM failed_jobs;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many likes did we have last month?
SELECT COUNT(*) FROM failed_jobs
WHERE failed_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many likes in each?
SELECT connection, COUNT(*) as count FROM failed_jobs GROUP BY connection;

-- 12. [MEDIUM] Are there any likes that don't have a match somewhere else?
SELECT * FROM failed_jobs LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY likeable_type ORDER BY id DESC) as rn
  FROM likes
) WHERE rn <= 3;

-- 14. [MEDIUM] How many notifications did we have last month?
SELECT COUNT(*) FROM failed_jobs
WHERE failed_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many notifications in each?
SELECT connection, COUNT(*) as count FROM failed_jobs GROUP BY connection;

-- 16. [MEDIUM] Are there any notifications that don't have a match somewhere else?
SELECT * FROM failed_jobs LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM likes
LEFT JOIN replies ON likes.likeable_id = replies.id
LEFT JOIN users ON likes.user_id = users.id
LEFT JOIN threads ON likes.likeable_id = threads.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT connection, COUNT(*) as cnt FROM failed_jobs GROUP BY connection
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY connection ORDER BY id DESC) as rn
  FROM failed_jobs
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM failed_jobs LIMIT 10;


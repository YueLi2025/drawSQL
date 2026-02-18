-- SQLite queries for: drawSQL-mysql-export-2026-02-09_messenger
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many threads do we have?
SELECT COUNT(*) FROM threads;

-- 3. [EASY] Show me all of our threads.
SELECT * FROM threads;

-- 4. [EASY] Can you look up a specific thread?
SELECT * FROM threads WHERE id = ?;

-- 5. [EASY] What threads were added or changed recently?
SELECT * FROM threads ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different subject values we have?
SELECT * FROM threads LIMIT 10;

-- 7. [EASY] How many messages do we have?
SELECT COUNT(*) FROM threads;

-- 8. [EASY] Show me all of our messages.
SELECT * FROM threads;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each thread along with its related details.
SELECT t.*, c.*
FROM threads t
LEFT JOIN messages c ON c.thread_id = t.id;

-- 11. [MEDIUM] How many threads did we have last month?
SELECT COUNT(*) FROM threads
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many threads in each?
SELECT subject, COUNT(*) as count FROM threads GROUP BY subject;

-- 13. [MEDIUM] Are there any threads that don't have a match somewhere else?
SELECT * FROM threads
WHERE id NOT IN (SELECT DISTINCT thread_id FROM messages WHERE thread_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM threads LIMIT 10;

-- 15. [MEDIUM] How many messages did we have last month?
SELECT COUNT(*) FROM threads
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many messages in each?
SELECT subject, COUNT(*) as count FROM threads GROUP BY subject;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM messages
LEFT JOIN threads ON messages.thread_id = threads.id
LEFT JOIN users ON messages.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT subject, COUNT(*) as cnt FROM threads GROUP BY subject
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject ORDER BY id DESC) as rn
  FROM threads
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM threads LIMIT 10;


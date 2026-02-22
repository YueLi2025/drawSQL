-- SQLite queries for: drawSQL-mysql-export-2026-02-09_messenger
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many threads do we have in total?
SELECT COUNT(*) FROM threads;

-- 3. [EASY] Show me all of our threads.
SELECT * FROM threads;

-- 4. [EASY] Can you look up the thread with id=num?
SELECT * FROM threads WHERE id = num;

-- 5. [EASY] How many threads were created since created_at=date?
SELECT COUNT(*) FROM threads
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent threads ordered by subject?
SELECT * FROM threads ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many messages do we have in total?
SELECT COUNT(*) FROM messages;

-- 8. [EASY] Show me all of our messages.
SELECT * FROM messages;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each thread along with its related details from other tables.
SELECT t.*, c.*
FROM threads t
LEFT JOIN messages c ON c.thread_id = t.id;

-- 11. [MEDIUM] How many threads were added since created_at=date?
SELECT COUNT(*) FROM threads
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the threads by subject — how many in each?
SELECT subject, COUNT(*) as count FROM threads GROUP BY subject;

-- 13. [MEDIUM] Are there any threads that don't have a match in related tables?
SELECT * FROM threads
WHERE id NOT IN (SELECT DISTINCT thread_id FROM messages WHERE thread_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 threads?
SELECT * FROM threads ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of threads change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM threads
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which threads have duplicate or repeated values?
WITH grouped AS (
  SELECT subject, COUNT(*) as cnt FROM threads GROUP BY subject
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on threads joining all related tables.
SELECT * FROM messages
LEFT JOIN threads ON messages.thread_id = threads.id
LEFT JOIN users ON messages.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of threads?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject ORDER BY id DESC) as rn
  FROM threads
) WHERE rn = num;

-- 19. [HARD] Which threads are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM threads
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group threads, filter, then rank the results.
WITH grouped AS (
  SELECT subject, COUNT(*) as cnt FROM threads GROUP BY subject
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of threads over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM threads
ORDER BY created_at;

-- 22. [HARD] Find threads that exist in one table but not in a related table.
SELECT * FROM threads
WHERE id NOT IN (SELECT DISTINCT thread_id FROM messages WHERE thread_id IS NOT NULL);

-- 23. [HARD] Combine data from threads, messages, and participants in a single report.
SELECT * FROM threads
LEFT JOIN messages ON messages.id = threads.thread_id
LEFT JOIN participants ON participants.id = threads.thread_id;

-- 24. [HARD] Rank all threads within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM threads;


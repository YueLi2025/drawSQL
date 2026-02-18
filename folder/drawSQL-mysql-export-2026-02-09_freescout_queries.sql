-- SQLite queries for: drawSQL-mysql-export-2026-02-09_freescout
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets are still open?
SELECT * FROM activity_logs LIMIT 10;

-- 2. [EASY] Which tickets were created this week?
SELECT * FROM activity_logs LIMIT 10;

-- 3. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many activity logs do we have?
SELECT COUNT(*) FROM activity_logs;

-- 5. [EASY] Show me all of our activity logs.
SELECT * FROM activity_logs;

-- 6. [EASY] Can you look up a specific activity log?
SELECT * FROM activity_logs WHERE id = ?;

-- 7. [EASY] Find the activity log with a certain name or email.
SELECT * FROM activity_logs WHERE log_name = ?;

-- 8. [EASY] What activity logs were added or changed recently?
SELECT * FROM activity_logs ORDER BY created_at DESC LIMIT 50;

-- 9. [MEDIUM] How long does it take us to resolve tickets on average?
SELECT * FROM activity_logs LIMIT 10;

-- 10. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many activity logs did we have last month?
SELECT COUNT(*) FROM activity_logs
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many activity logs in each?
SELECT subject_type, COUNT(*) as count FROM activity_logs GROUP BY subject_type;

-- 13. [MEDIUM] Are there any activity logs that don't have a match somewhere else?
SELECT * FROM activity_logs LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_logs
) WHERE rn <= 3;

-- 15. [MEDIUM] Break it down by type or category—how many attachments in each?
SELECT subject_type, COUNT(*) as count FROM activity_logs GROUP BY subject_type;

-- 16. [MEDIUM] Are there any attachments that don't have a match somewhere else?
SELECT * FROM activity_logs LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM attachments
LEFT JOIN threads ON attachments.thread_id = threads.id
LEFT JOIN users ON attachments.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT subject_type, COUNT(*) as cnt FROM activity_logs GROUP BY subject_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_type ORDER BY id DESC) as rn
  FROM activity_logs
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM ltm_translations t1
WHERE value > (
  SELECT AVG(value) FROM ltm_translations t2 WHERE t2.group = t1.group
);


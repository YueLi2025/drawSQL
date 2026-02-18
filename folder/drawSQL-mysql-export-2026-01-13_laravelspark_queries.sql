-- SQLite queries for: drawSQL-mysql-export-2026-01-13_laravelspark
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM announcements LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM announcements LIMIT 10;

-- 4. [EASY] How many announcements do we have?
SELECT COUNT(*) FROM announcements;

-- 5. [EASY] Show me all of our announcements.
SELECT * FROM announcements;

-- 6. [EASY] Can you look up a specific announcement?
SELECT * FROM announcements WHERE id = ?;

-- 7. [EASY] What announcements were added or changed recently?
SELECT * FROM announcements ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different user id values we have?
SELECT * FROM announcements LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many announcements did we have last month?
SELECT COUNT(*) FROM announcements
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many announcements in each?
SELECT user_id, COUNT(*) as count FROM announcements GROUP BY user_id;

-- 12. [MEDIUM] Are there any announcements that don't have a match somewhere else?
SELECT * FROM announcements LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM announcements LIMIT 10;

-- 14. [MEDIUM] How many api tokens did we have last month?
SELECT COUNT(*) FROM announcements
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many api tokens in each?
SELECT user_id, COUNT(*) as count FROM announcements GROUP BY user_id;

-- 16. [MEDIUM] Are there any api tokens that don't have a match somewhere else?
SELECT * FROM announcements LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM announcements
LEFT JOIN users ON announcements.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM announcements GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM announcements
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM invoices
WHERE total > (SELECT AVG(total) FROM invoices);


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_handesk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets are still open?
SELECT COUNT(*) FROM tickets WHERE status IN ('open', 'pending', 0);

-- 2. [EASY] Which tickets were created this week?
SELECT * FROM tickets
WHERE created_at >= date('now', '-7 days');

-- 3. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many people are on each team?
SELECT * FROM attachments LIMIT 10;

-- 5. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM attachments LIMIT 10;

-- 6. [EASY] How many attachments do we have?
SELECT COUNT(*) FROM attachments;

-- 7. [EASY] Show me all of our attachments.
SELECT * FROM attachments;

-- 8. [EASY] Can you look up a specific attachment?
SELECT * FROM attachments WHERE id = ?;

-- 9. [MEDIUM] How long does it take us to resolve tickets on average?
SELECT * FROM tickets LIMIT 10;

-- 10. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many attachments did we have last month?
SELECT COUNT(*) FROM attachments
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many attachments in each?
SELECT attachable_type, COUNT(*) as count FROM attachments GROUP BY attachable_type;

-- 13. [MEDIUM] Are there any attachments that don't have a match somewhere else?
SELECT * FROM attachments LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachable_type ORDER BY id DESC) as rn
  FROM attachments
) WHERE rn <= 3;

-- 15. [MEDIUM] How many comments did we have last month?
SELECT COUNT(*) FROM attachments
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many comments in each?
SELECT attachable_type, COUNT(*) as count FROM attachments GROUP BY attachable_type;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM comments
LEFT JOIN tickets ON comments.ticket_id = tickets.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT attachable_type, COUNT(*) as cnt FROM attachments GROUP BY attachable_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachable_type ORDER BY id DESC) as rn
  FROM attachments
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM kpis t1
WHERE total > (
  SELECT AVG(total) FROM kpis t2 WHERE t2.type = t1.type
);


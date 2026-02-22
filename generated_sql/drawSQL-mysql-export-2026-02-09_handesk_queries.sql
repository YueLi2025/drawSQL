-- SQLite queries for: drawSQL-mysql-export-2026-02-09_handesk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tickets have status=num indicating open?
SELECT COUNT(*) FROM tickets WHERE status = num;

-- 2. [EASY] Which tickets were created since created_at=date?
SELECT * FROM tickets
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many members are on each team?
SELECT team_id, COUNT(*) as member_count FROM memberships GROUP BY team_id;

-- 5. [EASY] How many attachments do we have in total?
SELECT COUNT(*) FROM attachments;

-- 6. [EASY] Show me all of our attachments.
SELECT * FROM attachments;

-- 7. [EASY] Can you look up the attachment with id=num?
SELECT * FROM attachments WHERE id = num;

-- 8. [EASY] How many attachments were created since created_at=date?
SELECT COUNT(*) FROM attachments
WHERE created_at >= date('now', '-1 month');

-- 9. [MEDIUM] What's the average resolution time for tickets?
SELECT AVG(julianday(updated_at) - julianday(created_at)) as avg_days FROM tickets;

-- 10. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 11. [MEDIUM] How many attachments were added since created_at=date?
SELECT COUNT(*) FROM attachments
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the attachments by attachable_type — how many in each?
SELECT attachable_type, COUNT(*) as count FROM attachments GROUP BY attachable_type;

-- 13. [MEDIUM] Are there any attachments that don't have a match in related tables?
SELECT * FROM attachments LIMIT num;

-- 14. [MEDIUM] For each group, what are the top 3 attachments?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachable_type ORDER BY id DESC) as rn
  FROM attachments
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of attachments change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM attachments
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which attachments have duplicate or repeated values?
WITH grouped AS (
  SELECT attachable_type, COUNT(*) as cnt FROM attachments GROUP BY attachable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on attachments joining all related tables.
SELECT * FROM comments
LEFT JOIN tickets ON comments.ticket_id = tickets.id;

-- 18. [HARD] Who or what is the best in each group of attachments?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachable_type ORDER BY id DESC) as rn
  FROM attachments
) WHERE rn = num;

-- 19. [HARD] Which attachments are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM attachments
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group attachments, filter, then rank the results.
WITH grouped AS (
  SELECT attachable_type, COUNT(*) as cnt FROM attachments GROUP BY attachable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of attachments over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM attachments
ORDER BY created_at;

-- 22. [HARD] Find attachments that exist in one table but not in a related table.
SELECT * FROM attachments LIMIT num;

-- 23. [HARD] Combine data from attachments, comments, and ideas in a single report.
SELECT * FROM attachments
LEFT JOIN comments ON comments.id = attachments.id
LEFT JOIN ideas ON ideas.id = attachments.id;

-- 24. [HARD] Rank all attachments within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachable_type ORDER BY id DESC) as rn
  FROM attachments
) WHERE rn <= num;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_orchid
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many attachmentable do we have in total?
SELECT COUNT(*) FROM attachmentable;

-- 3. [EASY] Show me all of our attachmentable.
SELECT * FROM attachmentable;

-- 4. [EASY] Can you look up the attachmentable with id=num?
SELECT * FROM attachmentable WHERE id = num;

-- 5. [EASY] How many attachmentable were created since attachmentable_type=date?
SELECT COUNT(*) FROM attachmentable
WHERE attachmentable_type >= date('now', '-1 month');

-- 6. [EASY] What are the most recent attachmentable ordered by attachmentable_type?
SELECT * FROM attachmentable ORDER BY attachmentable_type DESC LIMIT num;

-- 7. [EASY] How many attachments do we have in total?
SELECT COUNT(*) FROM attachments;

-- 8. [EASY] Show me all of our attachments.
SELECT * FROM attachments;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many attachmentable were added since attachmentable_type=date?
SELECT COUNT(*) FROM attachmentable
WHERE attachmentable_type >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the attachmentable by attachmentable_type — how many in each?
SELECT attachmentable_type, COUNT(*) as count FROM attachmentable GROUP BY attachmentable_type;

-- 12. [MEDIUM] Are there any attachmentable that don't have a match in related tables?
SELECT * FROM attachmentable LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 attachmentable?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachmentable_type ORDER BY id DESC) as rn
  FROM attachmentable
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of attachmentable change month over month?
SELECT
  strftime('%Y-%m', attachmentable_type) as period,
  COUNT(*) as count
FROM attachmentable
WHERE attachmentable_type >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which attachmentable have duplicate or repeated values?
WITH grouped AS (
  SELECT attachmentable_type, COUNT(*) as cnt FROM attachmentable GROUP BY attachmentable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each attachment along with its related details from other tables.
SELECT * FROM attachmentable;

-- 17. [HARD] Pull together a report on attachmentable joining all related tables.
SELECT * FROM attachmentable
LEFT JOIN attachments ON attachmentable.attachment_id = attachments.id;

-- 18. [HARD] Who or what is the best in each group of attachmentable?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachmentable_type ORDER BY id DESC) as rn
  FROM attachmentable
) WHERE rn = num;

-- 19. [HARD] Which attachmentable are above average compared to others in their group?
SELECT
  strftime('%Y-%m', attachmentable_type) as period,
  COUNT(*) as count
FROM attachmentable
WHERE attachmentable_type >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group attachmentable, filter, then rank the results.
WITH grouped AS (
  SELECT attachmentable_type, COUNT(*) as cnt FROM attachmentable GROUP BY attachmentable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of attachmentable over time based on attachmentable_type.
SELECT *, COUNT(*) OVER (ORDER BY attachmentable_type) as running_count
FROM attachmentable
ORDER BY attachmentable_type;

-- 22. [HARD] Find attachmentable that exist in one table but not in a related table.
SELECT * FROM attachmentable LIMIT num;

-- 23. [HARD] Combine data from attachmentable, attachments, and notifications in a single report.
SELECT * FROM attachmentable
LEFT JOIN attachments ON attachments.id = attachmentable.attachment_id
LEFT JOIN notifications ON notifications.id = attachmentable.id;

-- 24. [HARD] Rank all attachmentable within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachmentable_type ORDER BY id DESC) as rn
  FROM attachmentable
) WHERE rn <= num;


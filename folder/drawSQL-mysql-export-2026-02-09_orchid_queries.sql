-- SQLite queries for: drawSQL-mysql-export-2026-02-09_orchid
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many attachmentable do we have?
SELECT COUNT(*) FROM attachmentable;

-- 3. [EASY] Show me all of our attachmentable.
SELECT * FROM attachmentable;

-- 4. [EASY] Can you look up a specific attachmentable?
SELECT * FROM attachmentable WHERE id = ?;

-- 5. [EASY] What are the different attachmentable type values we have?
SELECT * FROM attachmentable LIMIT 10;

-- 6. [EASY] How many attachments do we have?
SELECT COUNT(*) FROM attachmentable;

-- 7. [EASY] Show me all of our attachments.
SELECT * FROM attachmentable;

-- 8. [EASY] Can you look up a specific attachment?
SELECT * FROM attachmentable WHERE id = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many attachmentable in each?
SELECT attachmentable_type, COUNT(*) as count FROM attachmentable GROUP BY attachmentable_type;

-- 11. [MEDIUM] Are there any attachmentable that don't have a match somewhere else?
SELECT * FROM attachmentable LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachmentable_type ORDER BY id DESC) as rn
  FROM attachmentable
) WHERE rn <= 3;

-- 13. [MEDIUM] Show me each attachment along with its related details.
SELECT * FROM attachmentable;

-- 14. [MEDIUM] How many attachments did we have last month?
SELECT COUNT(*) FROM attachmentable
WHERE attachmentable_type >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many attachments in each?
SELECT attachmentable_type, COUNT(*) as count FROM attachmentable GROUP BY attachmentable_type;

-- 16. [MEDIUM] Are there any attachments that don't have a match somewhere else?
SELECT * FROM attachmentable LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM attachmentable
LEFT JOIN attachments ON attachmentable.attachment_id = attachments.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT attachmentable_type, COUNT(*) as cnt FROM attachmentable GROUP BY attachmentable_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY attachmentable_type ORDER BY id DESC) as rn
  FROM attachmentable
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM settings
WHERE value > (SELECT AVG(value) FROM settings);


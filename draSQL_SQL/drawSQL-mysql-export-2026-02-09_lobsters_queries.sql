-- SQLite queries for: drawSQL-mysql-export-2026-02-09_lobsters
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM ar_internal_metadata LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM ar_internal_metadata LIMIT 10;

-- 4. [EASY] How many metadata do we have?
SELECT COUNT(*) FROM ar_internal_metadata;

-- 5. [EASY] Show me all of our metadata.
SELECT * FROM ar_internal_metadata;

-- 6. [EASY] Can you look up a specific metadata?
SELECT * FROM comments WHERE id = ?;

-- 7. [EASY] What metadata were added or changed recently?
SELECT * FROM ar_internal_metadata ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different value values we have?
SELECT * FROM ar_internal_metadata LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT u.*, COUNT(*) as activity_count
FROM users u
LEFT JOIN replying_comments a ON a.user_id = u.id
GROUP BY u.id
ORDER BY activity_count DESC;

-- 10. [MEDIUM] What's our total or average value across all metadata?
SELECT SUM(value) as total, AVG(value) as average FROM ar_internal_metadata;

-- 11. [MEDIUM] How many metadata did we have last month?
SELECT COUNT(*) FROM ar_internal_metadata
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many metadata in each?
SELECT value, COUNT(*) as count FROM ar_internal_metadata GROUP BY value;

-- 13. [MEDIUM] Which metadata has the highest or lowest value?
SELECT * FROM ar_internal_metadata ORDER BY value DESC LIMIT 1;

-- 14. [MEDIUM] Are there any metadata that don't have a match somewhere else?
SELECT * FROM ar_internal_metadata LIMIT 10;

-- 15. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM ar_internal_metadata LIMIT 10;

-- 16. [MEDIUM] Show me each comment along with its related details.
SELECT * FROM ar_internal_metadata;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM comments
LEFT JOIN replying_comments ON comments.user_id = replying_comments.parent_comment_id
LEFT JOIN stories ON comments.story_id = stories.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT created_at, COUNT(*) as cnt FROM ar_internal_metadata GROUP BY created_at
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY created_at ORDER BY value DESC) as rn
  FROM ar_internal_metadata
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM ar_internal_metadata
WHERE value > (SELECT AVG(value) FROM ar_internal_metadata);


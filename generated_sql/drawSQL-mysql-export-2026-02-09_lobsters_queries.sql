-- SQLite queries for: drawSQL-mysql-export-2026-02-09_lobsters
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT * FROM ar_internal_metadata LIMIT num;

-- 3. [EASY] How many metadata do we have in total?
SELECT COUNT(*) FROM ar_internal_metadata;

-- 4. [EASY] Show me all of our metadata.
SELECT * FROM ar_internal_metadata;

-- 5. [EASY] Can you look up the metadata with id=num?
SELECT * FROM comments WHERE id = num;

-- 6. [EASY] How many metadata were created since created_at=date?
SELECT COUNT(*) FROM ar_internal_metadata
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What metadata have value between num and num?
SELECT * FROM ar_internal_metadata WHERE value BETWEEN num AND num ORDER BY value;

-- 8. [EASY] What are the most recent metadata ordered by value?
SELECT * FROM ar_internal_metadata ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT u.*, COUNT(*) as activity_count
FROM users u
LEFT JOIN replying_comments a ON a.user_id = u.id
GROUP BY u.id
ORDER BY activity_count DESC;

-- 10. [MEDIUM] What's our total and average value across all metadata?
SELECT SUM(value) as total, AVG(value) as average FROM ar_internal_metadata;

-- 11. [MEDIUM] Which metadata has the highest value?
SELECT * FROM ar_internal_metadata ORDER BY value DESC LIMIT 1;

-- 12. [MEDIUM] How many metadata were added since created_at=date?
SELECT COUNT(*) FROM ar_internal_metadata
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Break down the metadata by value — how many in each?
SELECT value, COUNT(*) as count FROM ar_internal_metadata GROUP BY value;

-- 14. [MEDIUM] Are there any metadata that don't have a match in related tables?
SELECT * FROM ar_internal_metadata LIMIT num;

-- 15. [MEDIUM] For each group, what are the top 3 metadata?
SELECT * FROM ar_internal_metadata ORDER BY value DESC LIMIT num;

-- 16. [MEDIUM] How did the number of metadata change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM ar_internal_metadata
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 17. [HARD] Pull together a report on metadata joining all related tables.
SELECT * FROM comments
LEFT JOIN replying_comments ON comments.user_id = replying_comments.parent_comment_id
LEFT JOIN stories ON comments.story_id = stories.id;

-- 18. [HARD] Who or what is the best in each group of metadata?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY created_at ORDER BY value DESC) as rn
  FROM ar_internal_metadata
) WHERE rn = num;

-- 19. [HARD] Which metadata have value above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM ar_internal_metadata
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group metadata, filter, then rank the results.
WITH grouped AS (
  SELECT created_at, COUNT(*) as cnt FROM ar_internal_metadata GROUP BY created_at
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of metadata over time based on created_at.
SELECT *, SUM(value) OVER (ORDER BY created_at) as running_total
FROM ar_internal_metadata
ORDER BY created_at;

-- 22. [HARD] Find metadata that exist in one table but not in a related table.
SELECT * FROM ar_internal_metadata LIMIT num;

-- 23. [HARD] Combine data from ar_internal_metadata, comments, and domains in a single report.
SELECT * FROM ar_internal_metadata
LEFT JOIN comments ON comments.id = ar_internal_metadata.comment_id
LEFT JOIN domains ON domains.id = ar_internal_metadata.domain_id;

-- 24. [HARD] Rank all metadata within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY value DESC) as rn
FROM ar_internal_metadata;


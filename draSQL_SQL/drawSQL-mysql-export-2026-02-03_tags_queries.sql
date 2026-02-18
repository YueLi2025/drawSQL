-- SQLite queries for: drawSQL-mysql-export-2026-02-03_tags
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tags do we have?
SELECT COUNT(*) FROM tags;

-- 2. [EASY] Show me all of our tags.
SELECT * FROM tags;

-- 3. [EASY] Can you look up a specific tag?
SELECT * FROM tags WHERE id = ?;

-- 4. [EASY] Find the tag with a certain name or email.
SELECT * FROM tags WHERE name = ?;

-- 5. [EASY] What tags were added or changed recently?
SELECT * FROM tags ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different name values we have?
SELECT * FROM tags LIMIT 10;

-- 7. [EASY] How many taggables do we have?
SELECT COUNT(*) FROM tags;

-- 8. [EASY] Show me all of our taggables.
SELECT * FROM tags;

-- 9. [MEDIUM] Show me each tag along with its related details.
SELECT t.*, c.*
FROM tags t
LEFT JOIN taggables c ON c.tag_id = t.id;

-- 10. [MEDIUM] How many tags did we have last month?
SELECT COUNT(*) FROM tags
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many tags in each?
SELECT type, COUNT(*) as count FROM tags GROUP BY type;

-- 12. [MEDIUM] Are there any tags that don't have a match somewhere else?
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggables WHERE tag_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM tags
) WHERE rn <= 3;

-- 14. [MEDIUM] Break it down by type or category—how many taggables in each?
SELECT type, COUNT(*) as count FROM tags GROUP BY type;

-- 15. [MEDIUM] Are there any taggables that don't have a match somewhere else?
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggables WHERE tag_id IS NOT NULL);

-- 16. [MEDIUM] Are there any that exist in one list but not the other?
SELECT * FROM tags LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM taggables
LEFT JOIN tags ON taggables.tag_id = tags.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM tags GROUP BY type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM tags
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM tags LIMIT 10;


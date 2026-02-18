-- SQLite queries for: drawSQL-mysql-export-2026-02-17_taggable
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

-- 7. [EASY] How many taggings do we have?
SELECT COUNT(*) FROM tags;

-- 8. [EASY] Show me all of our taggings.
SELECT * FROM tags;

-- 9. [MEDIUM] Show me each tag along with its related details.
SELECT t.*, c.*
FROM tags t
LEFT JOIN taggings c ON c.taggable_id = t.id;

-- 10. [MEDIUM] How many tags did we have last month?
SELECT COUNT(*) FROM tags
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many tags in each?
SELECT name, COUNT(*) as count FROM tags GROUP BY name;

-- 12. [MEDIUM] Are there any tags that don't have a match somewhere else?
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT taggable_id FROM taggings WHERE taggable_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY taggable_type ORDER BY id DESC) as rn
  FROM taggings
) WHERE rn <= 3;

-- 14. [MEDIUM] How many taggings did we have last month?
SELECT COUNT(*) FROM tags
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many taggings in each?
SELECT name, COUNT(*) as count FROM tags GROUP BY name;

-- 16. [MEDIUM] Are there any taggings that don't have a match somewhere else?
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT taggable_id FROM taggings WHERE taggable_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM taggings
LEFT JOIN tags ON taggings.taggable_id = tags.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tags GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM tags
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM tags LIMIT 10;


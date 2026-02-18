-- SQLite queries for: drawSQL-mysql-export-2026-02-02_taggit
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many taggit tag do we have?
SELECT COUNT(*) FROM taggit_tag;

-- 2. [EASY] Show me all of our taggit tag.
SELECT * FROM taggit_tag;

-- 3. [EASY] Can you look up a specific taggit tag?
SELECT * FROM taggit_tag WHERE id = ?;

-- 4. [EASY] Find the taggit tag with a certain name or email.
SELECT * FROM taggit_tag WHERE name = ?;

-- 5. [EASY] What are the different name values we have?
SELECT * FROM taggit_tag LIMIT 10;

-- 6. [EASY] How many taggit taggeditem do we have?
SELECT COUNT(*) FROM taggit_tag;

-- 7. [EASY] Show me all of our taggit taggeditem.
SELECT * FROM taggit_tag;

-- 8. [EASY] Can you look up a specific taggit taggeditem?
SELECT * FROM taggit_tag WHERE id = ?;

-- 9. [MEDIUM] Show me each taggit tag along with its related details.
SELECT t.*, c.*
FROM taggit_tag t
LEFT JOIN taggit_taggeditem c ON c.tag_id = t.id;

-- 10. [MEDIUM] Break it down by type or category—how many taggit tag in each?
SELECT name, COUNT(*) as count FROM taggit_tag GROUP BY name;

-- 11. [MEDIUM] Are there any taggit tag that don't have a match somewhere else?
SELECT * FROM taggit_tag
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggit_taggeditem WHERE tag_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM taggit_taggeditem
) WHERE rn <= 3;

-- 13. [MEDIUM] Break it down by type or category—how many taggit taggeditem in each?
SELECT name, COUNT(*) as count FROM taggit_tag GROUP BY name;

-- 14. [MEDIUM] Are there any taggit taggeditem that don't have a match somewhere else?
SELECT * FROM taggit_tag
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggit_taggeditem WHERE tag_id IS NOT NULL);

-- 15. [MEDIUM] Are there any that exist in one list but not the other?
SELECT * FROM taggit_tag LIMIT 10;

-- 16. [MEDIUM] How did the numbers change compared to last month?
SELECT * FROM taggit_tag LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM taggit_taggeditem
LEFT JOIN taggit_tag ON taggit_taggeditem.tag_id = taggit_tag.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM taggit_tag GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM taggit_tag
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM taggit_tag LIMIT 10;


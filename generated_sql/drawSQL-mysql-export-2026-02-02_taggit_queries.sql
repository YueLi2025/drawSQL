-- SQLite queries for: drawSQL-mysql-export-2026-02-02_taggit
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many taggit tag do we have in total?
SELECT COUNT(*) FROM taggit_tag;

-- 2. [EASY] Show me all of our taggit tag.
SELECT * FROM taggit_tag;

-- 3. [EASY] Can you look up the taggit tag with id=num?
SELECT * FROM taggit_tag WHERE id = num;

-- 4. [EASY] Find the taggit tag where name=string.
SELECT * FROM taggit_tag WHERE name = string;

-- 5. [EASY] What are the most recent taggit tag ordered by name?
SELECT * FROM taggit_tag ORDER BY name DESC LIMIT num;

-- 6. [EASY] How many taggit taggeditem do we have in total?
SELECT COUNT(*) FROM taggit_tag;

-- 7. [EASY] Show me all of our taggit taggeditem.
SELECT * FROM taggit_tag;

-- 8. [EASY] Can you look up the taggit taggeditem with id=num?
SELECT * FROM taggit_tag WHERE id = num;

-- 9. [MEDIUM] Show me each taggit tag along with its related details from other tables.
SELECT t.*, c.*
FROM taggit_tag t
LEFT JOIN taggit_taggeditem c ON c.tag_id = t.id;

-- 10. [MEDIUM] Break down the taggit tag by name — how many in each?
SELECT name, COUNT(*) as count FROM taggit_tag GROUP BY name;

-- 11. [MEDIUM] Are there any taggit tag that don't have a match in related tables?
SELECT * FROM taggit_tag
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggit_taggeditem WHERE tag_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what are the top 3 taggit tag?
SELECT * FROM taggit_tag ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which taggit tag have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM taggit_tag GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Break down the taggit taggeditem by content_type_id — how many in each?
SELECT name, COUNT(*) as count FROM taggit_tag GROUP BY name;

-- 15. [MEDIUM] Are there any taggit taggeditem that don't have a match in related tables?
SELECT * FROM taggit_tag
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggit_taggeditem WHERE tag_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what are the top 3 taggit taggeditem?
SELECT * FROM taggit_tag ORDER BY id DESC LIMIT num;

-- 17. [HARD] Pull together a report on taggit tag joining all related tables.
SELECT * FROM taggit_taggeditem
LEFT JOIN taggit_tag ON taggit_taggeditem.tag_id = taggit_tag.id;

-- 18. [HARD] Who or what is the best in each group of taggit tag?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM taggit_tag
) WHERE rn = num;

-- 19. [HARD] Which taggit tag are above average compared to others in their group?
SELECT * FROM taggit_tag LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group taggit tag, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM taggit_tag GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find taggit tag that exist in one table but not in a related table.
SELECT * FROM taggit_tag
WHERE id NOT IN (SELECT DISTINCT tag_id FROM taggit_taggeditem WHERE tag_id IS NOT NULL);

-- 22. [HARD] Rank all taggit tag within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM taggit_tag;

-- 23. [HARD] Pull together a report on taggit taggeditem joining all related tables.
SELECT * FROM taggit_taggeditem
LEFT JOIN taggit_tag ON taggit_taggeditem.tag_id = taggit_tag.id;

-- 24. [HARD] Who or what is the best in each group of taggit taggeditem?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM taggit_tag
) WHERE rn = num;


-- SQLite queries for: drawSQL-mysql-export-2026-02-17_taggable
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many tags do we have in total?
SELECT COUNT(*) FROM tags;

-- 2. [EASY] Show me all of our tags.
SELECT * FROM tags;

-- 3. [EASY] Can you look up the tag with id=num?
SELECT * FROM tags WHERE id = num;

-- 4. [EASY] Find the tag where name=string.
SELECT * FROM tags WHERE name = string;

-- 5. [EASY] How many tags were created since created_at=date?
SELECT COUNT(*) FROM tags
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent tags ordered by name?
SELECT * FROM tags ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many taggings do we have in total?
SELECT COUNT(*) FROM taggings;

-- 8. [EASY] Show me all of our taggings.
SELECT * FROM taggings;

-- 9. [MEDIUM] Show me each tag along with its related details from other tables.
SELECT t.*, c.*
FROM tags t
LEFT JOIN taggings c ON c.taggable_id = t.id;

-- 10. [MEDIUM] How many tags were added since created_at=date?
SELECT COUNT(*) FROM tags
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the tags by name — how many in each?
SELECT name, COUNT(*) as count FROM tags GROUP BY name;

-- 12. [MEDIUM] Are there any tags that don't have a match in related tables?
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT taggable_id FROM taggings WHERE taggable_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 tags?
SELECT * FROM tags ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of tags change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM tags
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which tags have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tags GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many taggings were added since created_at=date?
SELECT COUNT(*) FROM taggings
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on tags joining all related tables.
SELECT * FROM taggings
LEFT JOIN tags ON taggings.taggable_id = tags.id;

-- 18. [HARD] Who or what is the best in each group of tags?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM tags
) WHERE rn = num;

-- 19. [HARD] Which tags are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM tags
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group tags, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tags GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of tags over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM tags
ORDER BY created_at;

-- 22. [HARD] Find tags that exist in one table but not in a related table.
SELECT * FROM tags
WHERE id NOT IN (SELECT DISTINCT taggable_id FROM taggings WHERE taggable_id IS NOT NULL);

-- 23. [HARD] Rank all tags within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM tags;

-- 24. [HARD] Pull together a report on taggings joining all related tables.
SELECT * FROM taggings
LEFT JOIN tags ON taggings.taggable_id = tags.id;


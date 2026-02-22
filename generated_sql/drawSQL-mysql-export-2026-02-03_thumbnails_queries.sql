-- SQLite queries for: drawSQL-mysql-export-2026-02-03_thumbnails
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many easy thumbnails source do we have in total?
SELECT COUNT(*) FROM easy_thumbnails_source;

-- 2. [EASY] Show me all of our easy thumbnails source.
SELECT * FROM easy_thumbnails_source;

-- 3. [EASY] Can you look up the easy thumbnails source with id=num?
SELECT * FROM easy_thumbnails_source WHERE id = num;

-- 4. [EASY] Find the easy thumbnails source where name=string.
SELECT * FROM easy_thumbnails_source WHERE name = string;

-- 5. [EASY] What are the most recent easy thumbnails source ordered by storage_hash?
SELECT * FROM easy_thumbnails_source ORDER BY storage_hash DESC LIMIT num;

-- 6. [EASY] How many easy thumbnails thumbnail do we have in total?
SELECT COUNT(*) FROM easy_thumbnails_thumbnail;

-- 7. [EASY] Show me all of our easy thumbnails thumbnail.
SELECT * FROM easy_thumbnails_thumbnail;

-- 8. [EASY] Can you look up the easy thumbnails thumbnail with id=num?
SELECT * FROM easy_thumbnails_thumbnail WHERE id = num;

-- 9. [MEDIUM] Show me each easy thumbnails source along with its related details from other tables.
SELECT t.*, c.*
FROM easy_thumbnails_source t
LEFT JOIN easy_thumbnails_thumbnail c ON c.source_id = t.id;

-- 10. [MEDIUM] Break down the easy thumbnails source by storage_hash — how many in each?
SELECT storage_hash, COUNT(*) as count FROM easy_thumbnails_source GROUP BY storage_hash;

-- 11. [MEDIUM] Are there any easy thumbnails source that don't have a match in related tables?
SELECT * FROM easy_thumbnails_source
WHERE id NOT IN (SELECT DISTINCT source_id FROM easy_thumbnails_thumbnail WHERE source_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what are the top 3 easy thumbnails source?
SELECT * FROM easy_thumbnails_source ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which easy thumbnails source have duplicate or repeated values?
WITH grouped AS (
  SELECT storage_hash, COUNT(*) as cnt FROM easy_thumbnails_source GROUP BY storage_hash
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Show me each easy thumbnails thumbnail along with its related details from other tables.
SELECT t.*, c.*
FROM easy_thumbnails_thumbnail t
LEFT JOIN easy_thumbnails_thumbnaildimensions c ON c.thumbnail_id = t.id;

-- 15. [MEDIUM] Break down the easy thumbnails thumbnail by storage_hash — how many in each?
SELECT storage_hash, COUNT(*) as count FROM easy_thumbnails_thumbnail GROUP BY storage_hash;

-- 16. [MEDIUM] Are there any easy thumbnails thumbnail that don't have a match in related tables?
SELECT * FROM easy_thumbnails_thumbnail
WHERE id NOT IN (SELECT DISTINCT thumbnail_id FROM easy_thumbnails_thumbnaildimensions WHERE thumbnail_id IS NOT NULL);

-- 17. [HARD] Pull together a report on easy thumbnails source joining all related tables.
SELECT * FROM easy_thumbnails_thumbnail
LEFT JOIN easy_thumbnails_source ON easy_thumbnails_thumbnail.source_id = easy_thumbnails_source.id;

-- 18. [HARD] Who or what is the best in each group of easy thumbnails source?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY storage_hash ORDER BY id DESC) as rn
  FROM easy_thumbnails_source
) WHERE rn = num;

-- 19. [HARD] Which easy thumbnails source are above average compared to others in their group?
SELECT * FROM easy_thumbnails_source LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group easy thumbnails source, filter, then rank the results.
WITH grouped AS (
  SELECT storage_hash, COUNT(*) as cnt FROM easy_thumbnails_source GROUP BY storage_hash
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find easy thumbnails source that exist in one table but not in a related table.
SELECT * FROM easy_thumbnails_source
WHERE id NOT IN (SELECT DISTINCT source_id FROM easy_thumbnails_thumbnail WHERE source_id IS NOT NULL);

-- 22. [HARD] Combine data from easy_thumbnails_source, easy_thumbnails_thumbnail, and easy_thumbnails_thumbnaildimensions in a single report.
SELECT * FROM easy_thumbnails_source
LEFT JOIN easy_thumbnails_thumbnail ON easy_thumbnails_thumbnail.id = easy_thumbnails_source.source_id
LEFT JOIN easy_thumbnails_thumbnaildimensions ON easy_thumbnails_thumbnaildimensions.id = easy_thumbnails_source.source_id;

-- 23. [HARD] Rank all easy thumbnails source within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM easy_thumbnails_source;

-- 24. [HARD] Pull together a report on easy thumbnails thumbnail joining all related tables.
SELECT * FROM easy_thumbnails_thumbnail
LEFT JOIN easy_thumbnails_source ON easy_thumbnails_thumbnail.source_id = easy_thumbnails_source.id;


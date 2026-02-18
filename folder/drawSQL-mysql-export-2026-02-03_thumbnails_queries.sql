-- SQLite queries for: drawSQL-mysql-export-2026-02-03_thumbnails
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many easy thumbnails source do we have?
SELECT COUNT(*) FROM easy_thumbnails_source;

-- 2. [EASY] Show me all of our easy thumbnails source.
SELECT * FROM easy_thumbnails_source;

-- 3. [EASY] Can you look up a specific easy thumbnails source?
SELECT * FROM easy_thumbnails_source WHERE id = ?;

-- 4. [EASY] Find the easy thumbnails source with a certain name or email.
SELECT * FROM easy_thumbnails_source WHERE name = ?;

-- 5. [EASY] What are the different storage hash values we have?
SELECT * FROM easy_thumbnails_source LIMIT 10;

-- 6. [EASY] How many easy thumbnails thumbnail do we have?
SELECT COUNT(*) FROM easy_thumbnails_source;

-- 7. [EASY] Show me all of our easy thumbnails thumbnail.
SELECT * FROM easy_thumbnails_source;

-- 8. [EASY] Can you look up a specific easy thumbnails thumbnail?
SELECT * FROM easy_thumbnails_source WHERE id = ?;

-- 9. [MEDIUM] Show me each easy thumbnails source along with its related details.
SELECT t.*, c.*
FROM easy_thumbnails_source t
LEFT JOIN easy_thumbnails_thumbnail c ON c.source_id = t.id;

-- 10. [MEDIUM] Break it down by type or category—how many easy thumbnails source in each?
SELECT storage_hash, COUNT(*) as count FROM easy_thumbnails_source GROUP BY storage_hash;

-- 11. [MEDIUM] Are there any easy thumbnails source that don't have a match somewhere else?
SELECT * FROM easy_thumbnails_source
WHERE id NOT IN (SELECT DISTINCT source_id FROM easy_thumbnails_thumbnail WHERE source_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM easy_thumbnails_source LIMIT 10;

-- 13. [MEDIUM] Show me each easy thumbnails thumbnail along with its related details.
SELECT t.*, c.*
FROM easy_thumbnails_source t
LEFT JOIN easy_thumbnails_thumbnail c ON c.source_id = t.id;

-- 14. [MEDIUM] Break it down by type or category—how many easy thumbnails thumbnail in each?
SELECT storage_hash, COUNT(*) as count FROM easy_thumbnails_source GROUP BY storage_hash;

-- 15. [MEDIUM] Are there any easy thumbnails thumbnail that don't have a match somewhere else?
SELECT * FROM easy_thumbnails_source
WHERE id NOT IN (SELECT DISTINCT source_id FROM easy_thumbnails_thumbnail WHERE source_id IS NOT NULL);

-- 16. [MEDIUM] Break it down by type or category—how many easy thumbnails thumbnaildimensions in each?
SELECT storage_hash, COUNT(*) as count FROM easy_thumbnails_source GROUP BY storage_hash;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM easy_thumbnails_thumbnail
LEFT JOIN easy_thumbnails_source ON easy_thumbnails_thumbnail.source_id = easy_thumbnails_source.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT storage_hash, COUNT(*) as cnt FROM easy_thumbnails_source GROUP BY storage_hash
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY storage_hash ORDER BY id DESC) as rn
  FROM easy_thumbnails_source
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM easy_thumbnails_source LIMIT 10;


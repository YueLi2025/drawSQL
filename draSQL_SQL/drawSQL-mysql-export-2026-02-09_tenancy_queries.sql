-- SQLite queries for: drawSQL-mysql-export-2026-02-09_tenancy
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many websites do we have?
SELECT COUNT(*) FROM websites;

-- 2. [EASY] Show me all of our websites.
SELECT * FROM websites;

-- 3. [EASY] Can you look up a specific website?
SELECT * FROM websites WHERE id = ?;

-- 4. [EASY] What websites were added or changed recently?
SELECT * FROM websites ORDER BY created_at DESC LIMIT 50;

-- 5. [EASY] What are the different uuid values we have?
SELECT * FROM websites LIMIT 10;

-- 6. [EASY] How many hostnames do we have?
SELECT COUNT(*) FROM websites;

-- 7. [EASY] Show me all of our hostnames.
SELECT * FROM websites;

-- 8. [EASY] Can you look up a specific hostname?
SELECT * FROM websites WHERE id = ?;

-- 9. [MEDIUM] Show me each website along with its related details.
SELECT t.*, c.*
FROM websites t
LEFT JOIN hostnames c ON c.website_id = t.id;

-- 10. [MEDIUM] How many websites did we have last month?
SELECT COUNT(*) FROM websites
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many websites in each?
SELECT uuid, COUNT(*) as count FROM websites GROUP BY uuid;

-- 12. [MEDIUM] Are there any websites that don't have a match somewhere else?
SELECT * FROM websites
WHERE id NOT IN (SELECT DISTINCT website_id FROM hostnames WHERE website_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM websites LIMIT 10;

-- 14. [MEDIUM] How many hostnames did we have last month?
SELECT COUNT(*) FROM websites
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many hostnames in each?
SELECT uuid, COUNT(*) as count FROM websites GROUP BY uuid;

-- 16. [MEDIUM] Are there any hostnames that don't have a match somewhere else?
SELECT * FROM websites
WHERE id NOT IN (SELECT DISTINCT website_id FROM hostnames WHERE website_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM hostnames
LEFT JOIN websites ON hostnames.website_id = websites.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT uuid, COUNT(*) as cnt FROM websites GROUP BY uuid
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY uuid ORDER BY id DESC) as rn
  FROM websites
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM websites LIMIT 10;


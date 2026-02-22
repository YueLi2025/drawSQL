-- SQLite queries for: drawSQL-mysql-export-2026-02-09_tenancy
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many websites do we have in total?
SELECT COUNT(*) FROM websites;

-- 2. [EASY] Show me all of our websites.
SELECT * FROM websites;

-- 3. [EASY] Can you look up the website with id=num?
SELECT * FROM websites WHERE id = num;

-- 4. [EASY] How many websites were created since created_at=date?
SELECT COUNT(*) FROM websites
WHERE created_at >= date('now', '-1 month');

-- 5. [EASY] What are the most recent websites ordered by uuid?
SELECT * FROM websites ORDER BY created_at DESC LIMIT num;

-- 6. [EASY] How many hostnames do we have in total?
SELECT COUNT(*) FROM hostnames;

-- 7. [EASY] Show me all of our hostnames.
SELECT * FROM hostnames;

-- 8. [EASY] Can you look up the hostname with id=num?
SELECT * FROM websites WHERE id = num;

-- 9. [MEDIUM] Show me each website along with its related details from other tables.
SELECT t.*, c.*
FROM websites t
LEFT JOIN hostnames c ON c.website_id = t.id;

-- 10. [MEDIUM] How many websites were added since created_at=date?
SELECT COUNT(*) FROM websites
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the websites by uuid — how many in each?
SELECT uuid, COUNT(*) as count FROM websites GROUP BY uuid;

-- 12. [MEDIUM] Are there any websites that don't have a match in related tables?
SELECT * FROM websites
WHERE id NOT IN (SELECT DISTINCT website_id FROM hostnames WHERE website_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 websites?
SELECT * FROM websites ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of websites change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM websites
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which websites have duplicate or repeated values?
WITH grouped AS (
  SELECT uuid, COUNT(*) as cnt FROM websites GROUP BY uuid
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many hostnames were added since created_at=date?
SELECT COUNT(*) FROM hostnames
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on websites joining all related tables.
SELECT * FROM hostnames
LEFT JOIN websites ON hostnames.website_id = websites.id;

-- 18. [HARD] Who or what is the best in each group of websites?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY uuid ORDER BY id DESC) as rn
  FROM websites
) WHERE rn = num;

-- 19. [HARD] Which websites are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM websites
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group websites, filter, then rank the results.
WITH grouped AS (
  SELECT uuid, COUNT(*) as cnt FROM websites GROUP BY uuid
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of websites over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM websites
ORDER BY created_at;

-- 22. [HARD] Find websites that exist in one table but not in a related table.
SELECT * FROM websites
WHERE id NOT IN (SELECT DISTINCT website_id FROM hostnames WHERE website_id IS NOT NULL);

-- 23. [HARD] Rank all websites within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM websites;

-- 24. [HARD] Pull together a report on hostnames joining all related tables.
SELECT * FROM hostnames
LEFT JOIN websites ON hostnames.website_id = websites.id;


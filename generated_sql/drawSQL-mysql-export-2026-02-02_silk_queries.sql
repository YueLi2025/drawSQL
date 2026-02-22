-- SQLite queries for: drawSQL-mysql-export-2026-02-02_silk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many silk profile do we have in total?
SELECT COUNT(*) FROM silk_profile;

-- 2. [EASY] Show me all of our silk profile.
SELECT * FROM silk_profile;

-- 3. [EASY] Can you look up the silk profile with id=num?
SELECT * FROM silk_profile WHERE id = num;

-- 4. [EASY] Find the silk profile where name=string.
SELECT * FROM silk_profile WHERE name = string;

-- 5. [EASY] How many silk profile were created since file_path=date?
SELECT COUNT(*) FROM silk_profile
WHERE file_path >= date('now', '-1 month');

-- 6. [EASY] What are the most recent silk profile ordered by name?
SELECT * FROM silk_profile ORDER BY file_path DESC LIMIT num;

-- 7. [EASY] How many silk profile queries do we have in total?
SELECT COUNT(*) FROM silk_profile;

-- 8. [EASY] Show me all of our silk profile queries.
SELECT * FROM silk_profile;

-- 9. [MEDIUM] Show me each silk profile along with its related details from other tables.
SELECT t.*, c.*
FROM silk_profile t
LEFT JOIN silk_profile_queries c ON c.profile_id = t.id;

-- 10. [MEDIUM] How many silk profile were added since file_path=date?
SELECT COUNT(*) FROM silk_profile
WHERE file_path >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the silk profile by name — how many in each?
SELECT name, COUNT(*) as count FROM silk_profile GROUP BY name;

-- 12. [MEDIUM] Are there any silk profile that don't have a match in related tables?
SELECT * FROM silk_profile
WHERE id NOT IN (SELECT DISTINCT profile_id FROM silk_profile_queries WHERE profile_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 silk profile?
SELECT * FROM silk_profile ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of silk profile change month over month?
SELECT
  strftime('%Y-%m', file_path) as period,
  COUNT(*) as count
FROM silk_profile
WHERE file_path >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which silk profile have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM silk_profile GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Break down the silk profile queries by profile_id — how many in each?
SELECT name, COUNT(*) as count FROM silk_profile GROUP BY name;

-- 17. [HARD] Pull together a report on silk profile joining all related tables.
SELECT * FROM silk_profile
LEFT JOIN silk_request ON silk_profile.request_id = silk_request.id;

-- 18. [HARD] Who or what is the best in each group of silk profile?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM silk_profile
) WHERE rn = num;

-- 19. [HARD] Which silk profile are above average compared to others in their group?
SELECT
  strftime('%Y-%m', file_path) as period,
  COUNT(*) as count
FROM silk_profile
WHERE file_path >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group silk profile, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM silk_profile GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of silk profile over time based on file_path.
SELECT *, COUNT(*) OVER (ORDER BY file_path) as running_count
FROM silk_profile
ORDER BY file_path;

-- 22. [HARD] Find silk profile that exist in one table but not in a related table.
SELECT * FROM silk_profile
WHERE id NOT IN (SELECT DISTINCT profile_id FROM silk_profile_queries WHERE profile_id IS NOT NULL);

-- 23. [HARD] Combine data from silk_profile, silk_profile_queries, and silk_request in a single report.
SELECT * FROM silk_profile
LEFT JOIN silk_profile_queries ON silk_profile_queries.id = silk_profile.profile_id
LEFT JOIN silk_request ON silk_request.id = silk_profile.request_id;

-- 24. [HARD] Rank all silk profile within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM silk_profile;


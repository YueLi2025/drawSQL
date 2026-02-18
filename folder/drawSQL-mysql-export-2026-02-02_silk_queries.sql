-- SQLite queries for: drawSQL-mysql-export-2026-02-02_silk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many silk profile do we have?
SELECT COUNT(*) FROM silk_profile;

-- 2. [EASY] Show me all of our silk profile.
SELECT * FROM silk_profile;

-- 3. [EASY] Can you look up a specific silk profile?
SELECT * FROM silk_profile WHERE id = ?;

-- 4. [EASY] Find the silk profile with a certain name or email.
SELECT * FROM silk_profile WHERE name = ?;

-- 5. [EASY] What are the different name values we have?
SELECT * FROM silk_profile LIMIT 10;

-- 6. [EASY] How many silk profile queries do we have?
SELECT COUNT(*) FROM silk_profile;

-- 7. [EASY] Show me all of our silk profile queries.
SELECT * FROM silk_profile;

-- 8. [EASY] Can you look up a specific silk profile query?
SELECT * FROM silk_profile WHERE id = ?;

-- 9. [MEDIUM] Show me each silk profile along with its related details.
SELECT t.*, c.*
FROM silk_profile t
LEFT JOIN silk_profile_queries c ON c.profile_id = t.id;

-- 10. [MEDIUM] Break it down by type or category—how many silk profile in each?
SELECT name, COUNT(*) as count FROM silk_profile GROUP BY name;

-- 11. [MEDIUM] Are there any silk profile that don't have a match somewhere else?
SELECT * FROM silk_profile
WHERE id NOT IN (SELECT DISTINCT profile_id FROM silk_profile_queries WHERE profile_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM silk_profile LIMIT 10;

-- 13. [MEDIUM] Break it down by type or category—how many silk profile queries in each?
SELECT name, COUNT(*) as count FROM silk_profile GROUP BY name;

-- 14. [MEDIUM] Are there any silk profile queries that don't have a match somewhere else?
SELECT * FROM silk_profile
WHERE id NOT IN (SELECT DISTINCT profile_id FROM silk_profile_queries WHERE profile_id IS NOT NULL);

-- 15. [MEDIUM] Show me each silk request along with its related details.
SELECT t.*, c.*
FROM silk_profile t
LEFT JOIN silk_profile_queries c ON c.profile_id = t.id;

-- 16. [MEDIUM] Break it down by type or category—how many silk request in each?
SELECT name, COUNT(*) as count FROM silk_profile GROUP BY name;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM silk_profile
LEFT JOIN silk_request ON silk_profile.request_id = silk_request.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM silk_profile GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM silk_profile
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM silk_profile LIMIT 10;


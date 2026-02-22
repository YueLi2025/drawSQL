-- SQLite queries for: drawSQL-mysql-export-2026-01-13_wordpress
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM wp_termmeta;

-- 2. [EASY] How many metadata do we have in total?
SELECT COUNT(*) FROM wp_termmeta;

-- 3. [EASY] Show me all of our metadata.
SELECT * FROM wp_termmeta;

-- 4. [EASY] Can you look up the metadata with id=num?
SELECT * FROM wp_termmeta LIMIT num;

-- 5. [EASY] What are the most recent metadata ordered by meta_id?
SELECT * FROM wp_termmeta ORDER BY term_id DESC LIMIT num;

-- 6. [EASY] How many wp terms do we have in total?
SELECT COUNT(*) FROM wp_terms;

-- 7. [EASY] Show me all of our wp terms.
SELECT * FROM wp_terms;

-- 8. [EASY] Can you look up the wp term with id=num?
SELECT * FROM wp_termmeta LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM wp_termmeta LIMIT num;

-- 10. [MEDIUM] Break down the metadata by meta_id — how many in each?
SELECT meta_id, COUNT(*) as count FROM wp_termmeta GROUP BY meta_id;

-- 11. [MEDIUM] Are there any metadata that don't have a match in related tables?
SELECT * FROM wp_termmeta LIMIT num;

-- 12. [MEDIUM] For each group, what are the top 3 metadata?
SELECT * FROM wp_termmeta ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which metadata have duplicate or repeated values?
WITH grouped AS (
  SELECT meta_id, COUNT(*) as cnt FROM wp_termmeta GROUP BY meta_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Show me each wp term along with its related details from other tables.
SELECT * FROM wp_termmeta;

-- 15. [MEDIUM] Break down the wp terms by term_group — how many in each?
SELECT term_group, COUNT(*) as count FROM wp_terms GROUP BY term_group;

-- 16. [MEDIUM] Are there any wp terms that don't have a match in related tables?
SELECT * FROM wp_terms
WHERE id NOT IN (SELECT DISTINCT term_id FROM wp_termmeta WHERE term_id IS NOT NULL);

-- 17. [HARD] Pull together a report on metadata joining all related tables.
SELECT * FROM wp_comments
LEFT JOIN wp_users ON wp_comments.user_id = wp_users.ID;

-- 18. [HARD] Who or what is the best in each group of metadata?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY term_id ORDER BY id DESC) as rn
  FROM wp_termmeta
) WHERE rn = num;

-- 19. [HARD] Which metadata are above average compared to others in their group?
SELECT * FROM wp_termmeta LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group metadata, filter, then rank the results.
WITH grouped AS (
  SELECT term_id, COUNT(*) as cnt FROM wp_termmeta GROUP BY term_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find metadata that exist in one table but not in a related table.
SELECT * FROM wp_termmeta LIMIT num;

-- 22. [HARD] Combine data from wp_termmeta, wp_terms, and wp_term_taxonomy in a single report.
SELECT * FROM wp_termmeta
LEFT JOIN wp_terms ON wp_terms.term_id = wp_termmeta.term_id
LEFT JOIN wp_term_taxonomy ON wp_term_taxonomy.term_taxonomy_id = wp_termmeta.term_taxonomy_id;

-- 23. [HARD] Rank all metadata within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM wp_termmeta;

-- 24. [HARD] Pull together a report on wp terms joining all related tables.
SELECT * FROM wp_comments
LEFT JOIN wp_users ON wp_comments.user_id = wp_users.ID;


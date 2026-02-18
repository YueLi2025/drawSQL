-- SQLite queries for: drawSQL-mysql-export-2026-01-13_wordpress
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM wp_termmeta;

-- 2. [EASY] How many metadata do we have?
SELECT COUNT(*) FROM wp_termmeta;

-- 3. [EASY] Show me all of our metadata.
SELECT * FROM wp_termmeta;

-- 4. [EASY] Can you look up a specific metadata?
SELECT * FROM wp_termmeta LIMIT 10;

-- 5. [EASY] What are the different meta id values we have?
SELECT * FROM wp_termmeta LIMIT 10;

-- 6. [EASY] How many wp terms do we have?
SELECT COUNT(*) FROM wp_termmeta;

-- 7. [EASY] Show me all of our wp terms.
SELECT * FROM wp_termmeta;

-- 8. [EASY] Can you look up a specific wp term?
SELECT * FROM wp_termmeta LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM wp_termmeta LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many metadata in each?
SELECT meta_id, COUNT(*) as count FROM wp_termmeta GROUP BY meta_id;

-- 11. [MEDIUM] Are there any metadata that don't have a match somewhere else?
SELECT * FROM wp_termmeta LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY term_group ORDER BY id DESC) as rn
  FROM wp_terms
) WHERE rn <= 3;

-- 13. [MEDIUM] Show me each wp term along with its related details.
SELECT * FROM wp_termmeta;

-- 14. [MEDIUM] Break it down by type or category—how many wp terms in each?
SELECT meta_id, COUNT(*) as count FROM wp_termmeta GROUP BY meta_id;

-- 15. [MEDIUM] Are there any wp terms that don't have a match somewhere else?
SELECT * FROM wp_termmeta LIMIT 10;

-- 16. [MEDIUM] Show me each wp term taxonomy along with its related details.
SELECT * FROM wp_termmeta;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM wp_comments
LEFT JOIN wp_users ON wp_comments.user_id = wp_users.ID;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT term_id, COUNT(*) as cnt FROM wp_termmeta GROUP BY term_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY term_id ORDER BY id DESC) as rn
  FROM wp_termmeta
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM wp_termmeta LIMIT 10;


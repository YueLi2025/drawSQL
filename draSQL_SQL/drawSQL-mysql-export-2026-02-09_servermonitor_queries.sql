-- SQLite queries for: drawSQL-mysql-export-2026-02-09_servermonitor
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many checks do we have?
SELECT COUNT(*) FROM checks;

-- 3. [EASY] Show me all of our checks.
SELECT * FROM checks;

-- 4. [EASY] Can you look up a specific check?
SELECT * FROM checks WHERE id = ?;

-- 5. [EASY] Which checks are currently active or turned on?
SELECT * FROM checks WHERE status = 1;

-- 6. [EASY] What checks were added or changed recently?
SELECT * FROM checks ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different host id values we have?
SELECT * FROM checks LIMIT 10;

-- 8. [EASY] How many hosts do we have?
SELECT COUNT(*) FROM checks;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM checks LIMIT 10;

-- 10. [MEDIUM] How many checks did we have last month?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many checks in each?
SELECT type, COUNT(*) as count FROM checks GROUP BY type;

-- 12. [MEDIUM] Are there any checks that don't have a match somewhere else?
SELECT * FROM checks LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM checks
) WHERE rn <= 3;

-- 14. [MEDIUM] Show me each host along with its related details.
SELECT * FROM checks;

-- 15. [MEDIUM] How many hosts did we have last month?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many hosts in each?
SELECT type, COUNT(*) as count FROM checks GROUP BY type;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM checks
LEFT JOIN hosts ON checks.host_id = hosts.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM checks GROUP BY type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM checks
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM checks LIMIT 10;


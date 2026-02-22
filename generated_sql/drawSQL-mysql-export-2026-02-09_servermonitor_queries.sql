-- SQLite queries for: drawSQL-mysql-export-2026-02-09_servermonitor
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many checks do we have in total?
SELECT COUNT(*) FROM checks;

-- 3. [EASY] Show me all of our checks.
SELECT * FROM checks;

-- 4. [EASY] Can you look up the check with id=num?
SELECT * FROM checks WHERE id = num;

-- 5. [EASY] Which checks have status=string?
SELECT * FROM checks WHERE status != 1 AND enabled = 1;

-- 6. [EASY] How many checks were created since created_at=date?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent checks ordered by host_id?
SELECT * FROM checks ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many hosts do we have in total?
SELECT COUNT(*) FROM hosts;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM checks LIMIT num;

-- 10. [MEDIUM] How many checks were added since created_at=date?
SELECT COUNT(*) FROM checks
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the checks by type — how many in each?
SELECT type, COUNT(*) as count FROM checks GROUP BY type;

-- 12. [MEDIUM] Are there any checks that don't have a match in related tables?
SELECT * FROM checks LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 checks?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM checks
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of checks change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM checks
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which checks have duplicate or repeated values?
SELECT * FROM checks WHERE status = num;

-- 16. [MEDIUM] Show me each host along with its related details from other tables.
SELECT * FROM checks;

-- 17. [HARD] Pull together a report on checks joining all related tables.
SELECT * FROM checks
LEFT JOIN hosts ON checks.host_id = hosts.id;

-- 18. [HARD] Who or what is the best in each group of checks?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM checks
) WHERE rn = num;

-- 19. [HARD] Which checks are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM checks
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group checks, filter, then rank the results.
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM checks GROUP BY type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of checks over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM checks
ORDER BY created_at;

-- 22. [HARD] Find checks that exist in one table but not in a related table.
SELECT * FROM checks LIMIT num;

-- 23. [HARD] Rank all checks within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM checks
) WHERE rn <= num;

-- 24. [HARD] Pull together a report on hosts joining all related tables.
SELECT * FROM checks
LEFT JOIN hosts ON checks.host_id = hosts.id;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09 _deployer
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many channels do we have?
SELECT COUNT(*) FROM cache;

-- 3. [EASY] Show me all of our channels.
SELECT * FROM cache;

-- 4. [EASY] Can you look up a specific channel?
SELECT * FROM channels WHERE id = ?;

-- 5. [EASY] Find the channel with a certain name or email.
SELECT * FROM channels WHERE name = ?;

-- 6. [EASY] What channels were added or changed recently?
SELECT * FROM cache ORDER BY expiration DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM cache LIMIT 10;

-- 8. [EASY] How many check urls do we have?
SELECT COUNT(*) FROM cache;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many channels did we have last month?
SELECT COUNT(*) FROM cache
WHERE expiration >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many channels in each?
SELECT value, COUNT(*) as count FROM cache GROUP BY value;

-- 12. [MEDIUM] Are there any channels that don't have a match somewhere else?
SELECT * FROM cache LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM channels
) WHERE rn <= 3;

-- 14. [MEDIUM] How many check urls did we have last month?
SELECT COUNT(*) FROM cache
WHERE expiration >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many check urls in each?
SELECT value, COUNT(*) as count FROM cache GROUP BY value;

-- 16. [MEDIUM] Are there any check urls that don't have a match somewhere else?
SELECT * FROM cache LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM channels
LEFT JOIN projects ON channels.project_id = projects.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT expiration, COUNT(*) as cnt FROM cache GROUP BY expiration
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY expiration ORDER BY value DESC) as rn
  FROM cache
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM variables t1
WHERE value > (
  SELECT AVG(value) FROM variables t2 WHERE t2.target_type = t1.target_type
);


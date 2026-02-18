-- SQLite queries for: drawSQL-mysql-export-2026-02-09_polr
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many clicks do we have?
SELECT COUNT(*) FROM clicks;

-- 3. [EASY] Show me all of our clicks.
SELECT * FROM clicks;

-- 4. [EASY] Can you look up a specific click?
SELECT * FROM clicks WHERE id = ?;

-- 5. [EASY] What clicks were added or changed recently?
SELECT * FROM clicks ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different country values we have?
SELECT * FROM clicks LIMIT 10;

-- 7. [EASY] How many links do we have?
SELECT COUNT(*) FROM clicks;

-- 8. [EASY] Show me all of our links.
SELECT * FROM clicks;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many clicks did we have last month?
SELECT COUNT(*) FROM clicks
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many clicks in each?
SELECT ip, COUNT(*) as count FROM clicks GROUP BY ip;

-- 12. [MEDIUM] Are there any clicks that don't have a match somewhere else?
SELECT * FROM clicks LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM clicks LIMIT 10;

-- 14. [MEDIUM] Show me each link along with its related details.
SELECT * FROM clicks;

-- 15. [MEDIUM] How many links did we have last month?
SELECT COUNT(*) FROM clicks
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many links in each?
SELECT ip, COUNT(*) as count FROM clicks GROUP BY ip;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM clicks
LEFT JOIN links ON clicks.link_id = links.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT ip, COUNT(*) as cnt FROM clicks GROUP BY ip
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY ip ORDER BY id DESC) as rn
  FROM clicks
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM clicks LIMIT 10;


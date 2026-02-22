-- SQLite queries for: drawSQL-mysql-export-2026-02-09_polr
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many clicks do we have in total?
SELECT COUNT(*) FROM clicks;

-- 3. [EASY] Show me all of our clicks.
SELECT * FROM clicks;

-- 4. [EASY] Can you look up the click with id=num?
SELECT * FROM clicks WHERE id = num;

-- 5. [EASY] How many clicks were created since created_at=date?
SELECT COUNT(*) FROM clicks
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent clicks ordered by country?
SELECT * FROM clicks ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many links do we have in total?
SELECT COUNT(*) FROM links;

-- 8. [EASY] Show me all of our links.
SELECT * FROM links;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many clicks were added since created_at=date?
SELECT COUNT(*) FROM clicks
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the clicks by ip — how many in each?
SELECT ip, COUNT(*) as count FROM clicks GROUP BY ip;

-- 12. [MEDIUM] Are there any clicks that don't have a match in related tables?
SELECT * FROM clicks LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 clicks?
SELECT * FROM clicks ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of clicks change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM clicks
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which clicks have duplicate or repeated values?
WITH grouped AS (
  SELECT ip, COUNT(*) as cnt FROM clicks GROUP BY ip
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each link along with its related details from other tables.
SELECT * FROM clicks;

-- 17. [HARD] Pull together a report on clicks joining all related tables.
SELECT * FROM clicks
LEFT JOIN links ON clicks.link_id = links.id;

-- 18. [HARD] Who or what is the best in each group of clicks?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY ip ORDER BY id DESC) as rn
  FROM clicks
) WHERE rn = num;

-- 19. [HARD] Which clicks are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM clicks
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group clicks, filter, then rank the results.
WITH grouped AS (
  SELECT ip, COUNT(*) as cnt FROM clicks GROUP BY ip
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of clicks over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM clicks
ORDER BY created_at;

-- 22. [HARD] Find clicks that exist in one table but not in a related table.
SELECT * FROM clicks LIMIT num;

-- 23. [HARD] Combine data from clicks, links, and users in a single report.
SELECT * FROM clicks
LEFT JOIN links ON links.id = clicks.link_id
LEFT JOIN users ON users.id = clicks.creator;

-- 24. [HARD] Rank all clicks within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM clicks;


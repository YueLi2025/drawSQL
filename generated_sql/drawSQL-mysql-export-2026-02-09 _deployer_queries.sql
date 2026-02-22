-- SQLite queries for: drawSQL-mysql-export-2026-02-09 _deployer
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many channels do we have in total?
SELECT COUNT(*) FROM channels;

-- 3. [EASY] Show me all of our channels.
SELECT * FROM channels;

-- 4. [EASY] Can you look up the channel with id=num?
SELECT * FROM channels WHERE id = num;

-- 5. [EASY] Find the channel where name=string.
SELECT * FROM channels WHERE name = string;

-- 6. [EASY] How many channels were created since created_at=date?
SELECT COUNT(*) FROM channels
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent channels ordered by name?
SELECT * FROM channels ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many check urls do we have in total?
SELECT COUNT(*) FROM check_urls;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many channels were added since created_at=date?
SELECT COUNT(*) FROM channels
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the channels by type — how many in each?
SELECT type, COUNT(*) as count FROM channels GROUP BY type;

-- 12. [MEDIUM] Are there any channels that don't have a match in related tables?
SELECT * FROM channels LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 channels?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM channels
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of channels change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM channels
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which channels have duplicate or repeated values?
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM channels GROUP BY type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many check urls were added since created_at=date?
SELECT COUNT(*) FROM check_urls
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on channels joining all related tables.
SELECT * FROM channels
LEFT JOIN projects ON channels.project_id = projects.id;

-- 18. [HARD] Who or what is the best in each group of channels?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY expiration ORDER BY value DESC) as rn
  FROM cache
) WHERE rn = num;

-- 19. [HARD] Which channels are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM channels
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group channels, filter, then rank the results.
WITH grouped AS (
  SELECT expiration, COUNT(*) as cnt FROM cache GROUP BY expiration
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of channels over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM channels
ORDER BY created_at;

-- 22. [HARD] Find channels that exist in one table but not in a related table.
SELECT * FROM channels LIMIT num;

-- 23. [HARD] Combine data from channels, check_urls, and command_server in a single report.
SELECT * FROM channels
LEFT JOIN check_urls ON check_urls.id = channels.id
LEFT JOIN command_server ON command_server.id = channels.id;

-- 24. [HARD] Rank all channels within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM channels
) WHERE rn <= num;


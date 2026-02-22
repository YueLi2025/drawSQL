-- SQLite queries for: drawSQL-mysql-export-2026-02-09_stats
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many tracker agents do we have in total?
SELECT COUNT(*) FROM tracker_agents;

-- 3. [EASY] Show me all of our tracker agents.
SELECT * FROM tracker_agents;

-- 4. [EASY] Can you look up the tracker agent with id=num?
SELECT * FROM tracker_agents WHERE id = num;

-- 5. [EASY] Find the tracker agent where name=string.
SELECT * FROM tracker_agents WHERE name = string;

-- 6. [EASY] How many tracker agents were created since created_at=date?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent tracker agents ordered by name?
SELECT * FROM tracker_agents ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many tracker connections do we have in total?
SELECT COUNT(*) FROM tracker_connections;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM tracker_agents LIMIT num;

-- 10. [MEDIUM] Show me each tracker agent along with its related details from other tables.
SELECT t.*, c.*
FROM tracker_agents t
LEFT JOIN tracker_sessions c ON c.agent_id = t.id;

-- 11. [MEDIUM] How many tracker agents were added since created_at=date?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the tracker agents by name — how many in each?
SELECT name, COUNT(*) as count FROM tracker_agents GROUP BY name;

-- 13. [MEDIUM] Are there any tracker agents that don't have a match in related tables?
SELECT * FROM tracker_agents
WHERE id NOT IN (SELECT DISTINCT agent_id FROM tracker_sessions WHERE agent_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 tracker agents?
SELECT * FROM tracker_agents ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of tracker agents change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM tracker_agents
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which tracker agents have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tracker_agents GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on tracker agents joining all related tables.
SELECT * FROM tracker_log
LEFT JOIN tracker_referers ON tracker_log.referer_id = tracker_referers.id
LEFT JOIN tracker_route_paths ON tracker_log.route_path_id = tracker_route_paths.id;

-- 18. [HARD] Who or what is the best in each group of tracker agents?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM tracker_agents
) WHERE rn = num;

-- 19. [HARD] Which tracker agents are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM tracker_agents
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group tracker agents, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tracker_agents GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of tracker agents over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM tracker_agents
ORDER BY created_at;

-- 22. [HARD] Find tracker agents that exist in one table but not in a related table.
SELECT * FROM tracker_agents
WHERE id NOT IN (SELECT DISTINCT agent_id FROM tracker_sessions WHERE agent_id IS NOT NULL);

-- 23. [HARD] Combine data from tracker_agents, tracker_connections, and tracker_cookies in a single report.
SELECT * FROM tracker_agents
LEFT JOIN tracker_connections ON tracker_connections.id = tracker_agents.agent_id
LEFT JOIN tracker_cookies ON tracker_cookies.id = tracker_agents.agent_id;

-- 24. [HARD] Rank all tracker agents within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM tracker_agents;


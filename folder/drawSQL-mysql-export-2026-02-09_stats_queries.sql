-- SQLite queries for: drawSQL-mysql-export-2026-02-09_stats
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many tracker agents do we have?
SELECT COUNT(*) FROM tracker_agents;

-- 3. [EASY] Show me all of our tracker agents.
SELECT * FROM tracker_agents;

-- 4. [EASY] Can you look up a specific tracker agent?
SELECT * FROM tracker_agents WHERE id = ?;

-- 5. [EASY] Find the tracker agent with a certain name or email.
SELECT * FROM tracker_agents WHERE name = ?;

-- 6. [EASY] What tracker agents were added or changed recently?
SELECT * FROM tracker_agents ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different name values we have?
SELECT * FROM tracker_agents LIMIT 10;

-- 8. [EASY] How many tracker connections do we have?
SELECT COUNT(*) FROM tracker_agents;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM tracker_agents LIMIT 10;

-- 10. [MEDIUM] Show me each tracker agent along with its related details.
SELECT t.*, c.*
FROM tracker_agents t
LEFT JOIN tracker_sessions c ON c.agent_id = t.id;

-- 11. [MEDIUM] How many tracker agents did we have last month?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many tracker agents in each?
SELECT name, COUNT(*) as count FROM tracker_agents GROUP BY name;

-- 13. [MEDIUM] Are there any tracker agents that don't have a match somewhere else?
SELECT * FROM tracker_agents
WHERE id NOT IN (SELECT DISTINCT agent_id FROM tracker_sessions WHERE agent_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM tracker_agents LIMIT 10;

-- 15. [MEDIUM] How many tracker connections did we have last month?
SELECT COUNT(*) FROM tracker_agents
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many tracker connections in each?
SELECT name, COUNT(*) as count FROM tracker_agents GROUP BY name;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM tracker_log
LEFT JOIN tracker_referers ON tracker_log.referer_id = tracker_referers.id
LEFT JOIN tracker_route_paths ON tracker_log.route_path_id = tracker_route_paths.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM tracker_agents GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM tracker_agents
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM tracker_query_arguments
WHERE value > (SELECT AVG(value) FROM tracker_query_arguments);


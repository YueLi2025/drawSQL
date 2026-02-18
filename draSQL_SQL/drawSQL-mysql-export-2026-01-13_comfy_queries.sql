-- SQLite queries for: drawSQL-mysql-export-2026-01-13_comfy
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activity log entries do we have?
SELECT COUNT(*) FROM actions;

-- 3. [EASY] Show me all of our activity log entries.
SELECT * FROM actions;

-- 4. [EASY] Can you look up a specific activity log entry?
SELECT * FROM actions WHERE id = ?;

-- 5. [EASY] Find the activity log entry with a certain name or email.
SELECT * FROM actions WHERE class_name = ?;

-- 6. [EASY] What activity log entries were added or changed recently?
SELECT * FROM actions ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different class name values we have?
SELECT * FROM actions LIMIT 10;

-- 8. [EASY] How many component groups do we have?
SELECT COUNT(*) FROM component_groups;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many activity log entries did we have last month?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many activity log entries in each?
SELECT class_name, COUNT(*) as count FROM actions GROUP BY class_name;

-- 12. [MEDIUM] Are there any activity log entries that don't have a match somewhere else?
SELECT * FROM actions LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY id DESC) as rn
  FROM components
) WHERE rn <= 3;

-- 14. [MEDIUM] Show me each component group along with its related details.
SELECT t.*, c.*
FROM component_groups t
LEFT JOIN components c ON c.group_id = t.id;

-- 15. [MEDIUM] How many component groups did we have last month?
SELECT COUNT(*) FROM component_groups
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many component groups in each?
SELECT name, COUNT(*) as count FROM component_groups GROUP BY name;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM incident_components
LEFT JOIN incidents ON incident_components.incident_id = incidents.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT class_name, COUNT(*) as cnt FROM actions GROUP BY class_name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY class_name ORDER BY id DESC) as rn
  FROM actions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM meta t1
WHERE value > (
  SELECT AVG(value) FROM meta t2 WHERE t2.meta_type = t1.meta_type
);


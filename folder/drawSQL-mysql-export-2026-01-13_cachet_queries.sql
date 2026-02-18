-- SQLite queries for: drawSQL-mysql-export-2026-01-13_cachet
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many incidents did we have this month?
SELECT COUNT(*) FROM incidents
WHERE strftime('%Y-%m', occurred_at) = strftime('%Y-%m', 'now');

-- 2. [EASY] Which components are currently down or having issues?
SELECT * FROM components WHERE status != 1 AND enabled = 1;

-- 3. [EASY] How many people are subscribed to get status updates?
SELECT COUNT(*) FROM subscribers;

-- 4. [EASY] What maintenance is scheduled for the next week?
SELECT * FROM schedules
WHERE scheduled_at BETWEEN date('now') AND date('now', '+7 days')
AND (completed_at IS NULL OR completed_at > datetime('now'));

-- 5. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] How many activity log entries do we have?
SELECT COUNT(*) FROM actions;

-- 7. [EASY] Show me all of our activity log entries.
SELECT * FROM actions;

-- 8. [EASY] Can you look up a specific activity log entry?
SELECT * FROM actions WHERE id = ?;

-- 9. [MEDIUM] What's the latest update on each incident?
SELECT i.*, iu.message, iu.status, iu.created_at as update_at
FROM incidents i
LEFT JOIN (
  SELECT iu1.* FROM incident_updates iu1
  INNER JOIN (
    SELECT incident_id, MAX(created_at) as max_at
    FROM incident_updates GROUP BY incident_id
  ) iu2 ON iu1.incident_id = iu2.incident_id AND iu1.created_at = iu2.max_at
) iu ON iu.incident_id = i.id;

-- 10. [MEDIUM] How many components do we have in each group?
SELECT cg.name as group_name, COUNT(c.id) as component_count
FROM component_groups cg
LEFT JOIN components c ON c.group_id = cg.id
GROUP BY cg.id, cg.name;

-- 11. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 12. [MEDIUM] How many activity log entries did we have last month?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Break it down by type or category—how many activity log entries in each?
SELECT class_name, COUNT(*) as count FROM actions GROUP BY class_name;

-- 14. [MEDIUM] Are there any activity log entries that don't have a match somewhere else?
SELECT * FROM actions LIMIT 10;

-- 15. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY id DESC) as rn
  FROM components
) WHERE rn <= 3;

-- 16. [MEDIUM] Show me each component group along with its related details.
SELECT t.*, c.*
FROM component_groups t
LEFT JOIN components c ON c.group_id = t.id;

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


-- SQLite queries for: drawSQL-mysql-export-2026-01-13_cachet
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many incidents did we have since occurred_at=date?
SELECT COUNT(*) FROM incidents
WHERE occurred_at >= date('now', '-1 month');

-- 2. [EASY] Which components have status=num indicating they are down?
SELECT * FROM components WHERE status != 1 AND enabled = 1;

-- 3. [EASY] How many people are subscribed to get status updates?
SELECT COUNT(*) FROM subscribers;

-- 4. [EASY] What maintenance is scheduled between scheduled_at=date and scheduled_at=date?
SELECT * FROM schedules
WHERE scheduled_at BETWEEN date('now') AND date('now', '+7 days')
AND (completed_at IS NULL OR completed_at > datetime('now'));

-- 5. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] How many activity log entries do we have in total?
SELECT COUNT(*) FROM actions;

-- 7. [EASY] Show me all of our activity log entries.
SELECT * FROM actions;

-- 8. [EASY] Can you look up the activity log entry with id=num?
SELECT * FROM actions WHERE id = num;

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

-- 11. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 12. [MEDIUM] How many activity log entries were added since created_at=date?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 13. [MEDIUM] Break down the activity log entries by class_name — how many in each?
SELECT class_name, COUNT(*) as count FROM actions GROUP BY class_name;

-- 14. [MEDIUM] Are there any activity log entries that don't have a match in related tables?
SELECT * FROM actions LIMIT num;

-- 15. [MEDIUM] For each group, what are the top 3 activity log entries?
SELECT * FROM actions ORDER BY id DESC LIMIT num;

-- 16. [MEDIUM] How did the number of activity log entries change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM actions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 17. [HARD] Pull together a report on activity log entries joining all related tables.
SELECT * FROM incident_components
LEFT JOIN incidents ON incident_components.incident_id = incidents.id;

-- 18. [HARD] Who or what is the best in each group of activity log entries?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY class_name ORDER BY id DESC) as rn
  FROM actions
) WHERE rn = num;

-- 19. [HARD] Which activity log entries are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM actions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group activity log entries, filter, then rank the results.
WITH grouped AS (
  SELECT class_name, COUNT(*) as cnt FROM actions GROUP BY class_name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of activity log entries over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM actions
ORDER BY created_at;

-- 22. [HARD] Find activity log entries that exist in one table but not in a related table.
SELECT * FROM actions LIMIT num;

-- 23. [HARD] Combine data from actions, component_groups, and components in a single report.
SELECT * FROM actions
LEFT JOIN component_groups ON component_groups.id = actions.group_id
LEFT JOIN components ON components.id = actions.taggable_id;

-- 24. [HARD] Rank all activity log entries within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM actions;


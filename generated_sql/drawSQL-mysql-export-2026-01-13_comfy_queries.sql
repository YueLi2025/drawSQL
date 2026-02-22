-- SQLite queries for: drawSQL-mysql-export-2026-01-13_comfy
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many activity log entries do we have in total?
SELECT COUNT(*) FROM actions;

-- 3. [EASY] Show me all of our activity log entries.
SELECT * FROM actions;

-- 4. [EASY] Can you look up the activity log entry with id=num?
SELECT * FROM actions WHERE id = num;

-- 5. [EASY] Find the activity log entry where class_name=string.
SELECT * FROM actions WHERE class_name = string;

-- 6. [EASY] How many activity log entries were created since created_at=date?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent activity log entries ordered by class_name?
SELECT * FROM actions ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many component groups do we have in total?
SELECT COUNT(*) FROM component_groups;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many activity log entries were added since created_at=date?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the activity log entries by class_name — how many in each?
SELECT class_name, COUNT(*) as count FROM actions GROUP BY class_name;

-- 12. [MEDIUM] Are there any activity log entries that don't have a match in related tables?
SELECT * FROM actions LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 activity log entries?
SELECT * FROM actions ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of activity log entries change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM actions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which activity log entries have duplicate or repeated values?
WITH grouped AS (
  SELECT class_name, COUNT(*) as cnt FROM actions GROUP BY class_name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each component group along with its related details from other tables.
SELECT t.*, c.*
FROM component_groups t
LEFT JOIN components c ON c.group_id = t.id;

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


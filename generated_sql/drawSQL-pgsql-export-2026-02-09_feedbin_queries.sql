-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_feedbin
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

-- 5. [EASY] Find the activity log entry where title=string.
SELECT * FROM actions WHERE title = string;

-- 6. [EASY] Which activity log entries have status=num?
SELECT * FROM actions WHERE status = num;

-- 7. [EASY] How many activity log entries were created since created_at=date?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent activity log entries ordered by user_id?
SELECT * FROM actions ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each activity log entry along with its related details from other tables.
SELECT t.*, c.*
FROM actions t
LEFT JOIN actions c ON c.id = t.user_id;

-- 11. [MEDIUM] How many activity log entries were added since created_at=date?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the activity log entries by action_type — how many in each?
SELECT action_type, COUNT(*) as count FROM actions GROUP BY action_type;

-- 13. [MEDIUM] Are there any activity log entries that don't have a match in related tables?
SELECT * FROM actions LIMIT num;

-- 14. [MEDIUM] For each group, what are the top 3 activity log entries?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY id DESC) as rn
  FROM actions
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of activity log entries change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM actions
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which activity log entries have duplicate or repeated values?
SELECT * FROM actions WHERE status = num;

-- 17. [HARD] Pull together a report on activity log entries joining all related tables.
SELECT * FROM actions
LEFT JOIN users ON actions.id = users.plan_id
LEFT JOIN actions ON actions.id = actions.user_id
LEFT JOIN recently_read_entries ON actions.id = recently_read_entries.user_id
LEFT JOIN feed_stats ON actions.id = feed_stats.feed_id;

-- 18. [HARD] Who or what is the best in each group of activity log entries?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY id DESC) as rn
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
  SELECT action_type, COUNT(*) as cnt FROM actions GROUP BY action_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of activity log entries over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM actions
ORDER BY created_at;

-- 22. [HARD] Find activity log entries that exist in one table but not in a related table.
SELECT * FROM actions LIMIT num;

-- 23. [HARD] Combine data from actions, authentication_tokens, and billing_events in a single report.
SELECT * FROM actions
LEFT JOIN authentication_tokens ON authentication_tokens.user_id = actions.id
LEFT JOIN billing_events ON billing_events.user_id = actions.id;

-- 24. [HARD] Rank all activity log entries within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY id DESC) as rn
  FROM actions
) WHERE rn <= num;


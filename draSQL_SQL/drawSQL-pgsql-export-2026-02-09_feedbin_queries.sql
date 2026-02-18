-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_feedbin
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
SELECT * FROM actions LIMIT 10;

-- 6. [EASY] Which activity log entries are currently active or turned on?
SELECT * FROM actions WHERE status = 1;

-- 7. [EASY] What activity log entries were added or changed recently?
SELECT * FROM actions ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different user id values we have?
SELECT * FROM actions LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each activity log entry along with its related details.
SELECT t.*, c.*
FROM actions t
LEFT JOIN actions c ON c.id = t.user_id;

-- 11. [MEDIUM] How many activity log entries did we have last month?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many activity log entries in each?
SELECT action_type, COUNT(*) as count FROM actions GROUP BY action_type;

-- 13. [MEDIUM] Are there any activity log entries that don't have a match somewhere else?
SELECT * FROM actions LIMIT 10;

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY id DESC) as rn
  FROM actions
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each authentication token along with its related details.
SELECT t.*, c.*
FROM actions t
LEFT JOIN actions c ON c.id = t.user_id;

-- 16. [MEDIUM] How many authentication tokens did we have last month?
SELECT COUNT(*) FROM actions
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM actions
LEFT JOIN users ON actions.id = users.plan_id
LEFT JOIN actions ON actions.id = actions.user_id
LEFT JOIN recently_read_entries ON actions.id = recently_read_entries.user_id
LEFT JOIN feed_stats ON actions.id = feed_stats.feed_id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT action_type, COUNT(*) as cnt FROM actions GROUP BY action_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY id DESC) as rn
  FROM actions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM plans
WHERE price > (SELECT AVG(price) FROM plans);


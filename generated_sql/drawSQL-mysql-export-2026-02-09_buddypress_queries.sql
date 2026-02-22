-- SQLite queries for: drawSQL-mysql-export-2026-02-09_buddypress
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM bp_notifications
WHERE date_notified >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT group_id, COUNT(*) as member_count FROM bp_groups_members GROUP BY group_id;

-- 3. [EASY] How many bp notifications do we have in total?
SELECT COUNT(*) FROM bp_notifications;

-- 4. [EASY] Show me all of our bp notifications.
SELECT * FROM bp_notifications;

-- 5. [EASY] Can you look up the bp notification with id=num?
SELECT * FROM bp_notifications WHERE id = num;

-- 6. [EASY] Find the bp notification where component_name=string.
SELECT * FROM bp_notifications WHERE component_name = string;

-- 7. [EASY] How many bp notifications were created since date_notified=date?
SELECT COUNT(*) FROM bp_notifications
WHERE date_notified >= date('now', '-1 month');

-- 8. [EASY] What are the most recent bp notifications ordered by user_id?
SELECT * FROM bp_notifications ORDER BY date_notified DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM bp_notifications LIMIT num;

-- 10. [MEDIUM] Show me each bp notification along with its related details from other tables.
SELECT t.*, c.*
FROM bp_notifications t
LEFT JOIN bp_notifications_meta c ON c.notification_id = t.id;

-- 11. [MEDIUM] How many bp notifications were added since date_notified=date?
SELECT COUNT(*) FROM bp_notifications
WHERE date_notified >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the bp notifications by user_id — how many in each?
SELECT user_id, COUNT(*) as count FROM bp_notifications GROUP BY user_id;

-- 13. [MEDIUM] Are there any bp notifications that don't have a match in related tables?
SELECT * FROM bp_notifications
WHERE id NOT IN (SELECT DISTINCT notification_id FROM bp_notifications_meta WHERE notification_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 bp notifications?
SELECT * FROM bp_notifications ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of bp notifications change month over month?
SELECT
  strftime('%Y-%m', date_notified) as period,
  COUNT(*) as count
FROM bp_notifications
WHERE date_notified >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which bp notifications have duplicate or repeated values?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM bp_notifications GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on bp notifications joining all related tables.
SELECT * FROM bp_notifications;

-- 18. [HARD] Who or what is the best in each group of bp notifications?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM bp_notifications
) WHERE rn = num;

-- 19. [HARD] Which bp notifications are above average compared to others in their group?
SELECT
  strftime('%Y-%m', date_notified) as period,
  COUNT(*) as count
FROM bp_notifications
WHERE date_notified >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group bp notifications, filter, then rank the results.
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM bp_notifications GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of bp notifications over time based on date_notified.
SELECT *, COUNT(*) OVER (ORDER BY date_notified) as running_count
FROM bp_notifications
ORDER BY date_notified;

-- 22. [HARD] Find bp notifications that exist in one table but not in a related table.
SELECT * FROM bp_notifications
WHERE id NOT IN (SELECT DISTINCT notification_id FROM bp_notifications_meta WHERE notification_id IS NOT NULL);

-- 23. [HARD] Combine data from bp_notifications, bp_notifications_meta, and bp_activity in a single report.
SELECT * FROM bp_notifications
LEFT JOIN bp_notifications_meta ON bp_notifications_meta.id = bp_notifications.notification_id
LEFT JOIN bp_activity ON bp_activity.id = bp_notifications.activity_id;

-- 24. [HARD] Rank all bp notifications within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM bp_notifications;


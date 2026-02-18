-- SQLite queries for: drawSQL-mysql-export-2026-02-09_buddypress
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM bp_notifications
WHERE date_notified >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM bp_notifications LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM bp_notifications LIMIT 10;

-- 4. [EASY] How many bp notifications do we have?
SELECT COUNT(*) FROM bp_notifications;

-- 5. [EASY] Show me all of our bp notifications.
SELECT * FROM bp_notifications;

-- 6. [EASY] Can you look up a specific bp notification?
SELECT * FROM bp_notifications WHERE id = ?;

-- 7. [EASY] Find the bp notification with a certain name or email.
SELECT * FROM bp_notifications WHERE component_name = ?;

-- 8. [EASY] What bp notifications were added or changed recently?
SELECT * FROM bp_notifications ORDER BY date_notified DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM bp_notifications LIMIT 10;

-- 10. [MEDIUM] Show me each bp notification along with its related details.
SELECT t.*, c.*
FROM bp_notifications t
LEFT JOIN bp_notifications_meta c ON c.notification_id = t.id;

-- 11. [MEDIUM] How many bp notifications did we have last month?
SELECT COUNT(*) FROM bp_notifications
WHERE date_notified >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many bp notifications in each?
SELECT user_id, COUNT(*) as count FROM bp_notifications GROUP BY user_id;

-- 13. [MEDIUM] Are there any bp notifications that don't have a match somewhere else?
SELECT * FROM bp_notifications
WHERE id NOT IN (SELECT DISTINCT notification_id FROM bp_notifications_meta WHERE notification_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM bp_activity
) WHERE rn <= 3;

-- 15. [MEDIUM] Break it down by type or category—how many metadata in each?
SELECT user_id, COUNT(*) as count FROM bp_notifications GROUP BY user_id;

-- 16. [MEDIUM] Are there any metadata that don't have a match somewhere else?
SELECT * FROM bp_notifications
WHERE id NOT IN (SELECT DISTINCT notification_id FROM bp_notifications_meta WHERE notification_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM bp_notifications;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM bp_notifications GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM bp_notifications
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM bp_xprofile_data
WHERE value > (SELECT AVG(value) FROM bp_xprofile_data);


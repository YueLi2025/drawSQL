-- SQLite queries for: drawSQL-mysql-export-2026-02-02_cabot
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many alert acknowledgement do we have in total?
SELECT COUNT(*) FROM alert_acknowledgement;

-- 3. [EASY] Show me all of our alert acknowledgement.
SELECT * FROM alert_acknowledgement;

-- 4. [EASY] Can you look up the alert acknowledgement with id=num?
SELECT * FROM alert_acknowledgement WHERE id = num;

-- 5. [EASY] What are the most recent alert acknowledgement ordered by time?
SELECT * FROM alert_acknowledgement ORDER BY time DESC LIMIT num;

-- 6. [EASY] How many alert plugin do we have in total?
SELECT COUNT(*) FROM alert_plugin;

-- 7. [EASY] Show me all of our alert plugin.
SELECT * FROM alert_plugin;

-- 8. [EASY] Can you look up the alert plugin with id=num?
SELECT * FROM alert_plugin WHERE id = num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM user LIMIT num;

-- 10. [MEDIUM] Break down the alert acknowledgement by time — how many in each?
SELECT time, COUNT(*) as count FROM alert_acknowledgement GROUP BY time;

-- 11. [MEDIUM] Are there any alert acknowledgement that don't have a match in related tables?
SELECT * FROM alert_acknowledgement LIMIT num;

-- 12. [MEDIUM] For each group, what are the top 3 alert acknowledgement?
SELECT * FROM alert_acknowledgement ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which alert acknowledgement have duplicate or repeated values?
WITH grouped AS (
  SELECT time, COUNT(*) as cnt FROM alert_acknowledgement GROUP BY time
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Show me each alert plugin along with its related details from other tables.
SELECT t.*, c.*
FROM alert_plugin t
LEFT JOIN alert_plugin_instance c ON c.alert_plugin_id = t.id;

-- 15. [MEDIUM] Break down the alert plugin by polumorphic_ctype — how many in each?
SELECT polumorphic_ctype, COUNT(*) as count FROM alert_plugin GROUP BY polumorphic_ctype;

-- 16. [MEDIUM] Are there any alert plugin that don't have a match in related tables?
SELECT * FROM alert_plugin
WHERE id NOT IN (SELECT DISTINCT alert_plugin_id FROM alert_plugin_instance WHERE alert_plugin_id IS NOT NULL);

-- 17. [HARD] Pull together a report on alert acknowledgement joining all related tables.
SELECT * FROM alert_acknowledgement;

-- 18. [HARD] Who or what is the best in each group of alert acknowledgement?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY time ORDER BY id DESC) as rn
  FROM alert_acknowledgement
) WHERE rn = num;

-- 19. [HARD] Which alert acknowledgement are above average compared to others in their group?
SELECT * FROM status_check t1
WHERE value > (
  SELECT AVG(value) FROM status_check t2 WHERE t2.check_type = t1.check_type
);

-- 20. [HARD] Do a multi-step analysis: group alert acknowledgement, filter, then rank the results.
WITH grouped AS (
  SELECT time, COUNT(*) as cnt FROM alert_acknowledgement GROUP BY time
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find alert acknowledgement that exist in one table but not in a related table.
SELECT * FROM alert_acknowledgement LIMIT num;

-- 22. [HARD] Combine data from alert_acknowledgement, alert_plugin, and alert_plugin_user_data in a single report.
SELECT * FROM alert_acknowledgement
LEFT JOIN alert_plugin ON alert_plugin.id = alert_acknowledgement.alert_plugin_id
LEFT JOIN alert_plugin_user_data ON alert_plugin_user_data.id = alert_acknowledgement.id
LEFT JOIN user ON user.id = alert_acknowledgement.created_by;

-- 23. [HARD] Rank all alert acknowledgement within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM alert_acknowledgement;

-- 24. [HARD] Pull together a report on alert plugin joining all related tables.
SELECT * FROM alert_acknowledgement;


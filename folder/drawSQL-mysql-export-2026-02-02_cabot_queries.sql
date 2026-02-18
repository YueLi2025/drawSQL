-- SQLite queries for: drawSQL-mysql-export-2026-02-02_cabot
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM alert_acknowledgement;

-- 2. [EASY] How many alert acknowledgement do we have?
SELECT COUNT(*) FROM alert_acknowledgement;

-- 3. [EASY] Show me all of our alert acknowledgement.
SELECT * FROM alert_acknowledgement;

-- 4. [EASY] Can you look up a specific alert acknowledgement?
SELECT * FROM alert_acknowledgement WHERE id = ?;

-- 5. [EASY] What are the different time values we have?
SELECT * FROM alert_acknowledgement LIMIT 10;

-- 6. [EASY] How many alert plugin do we have?
SELECT COUNT(*) FROM alert_acknowledgement;

-- 7. [EASY] Show me all of our alert plugin.
SELECT * FROM alert_acknowledgement;

-- 8. [EASY] Can you look up a specific alert plugin?
SELECT * FROM alert_acknowledgement WHERE id = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM alert_acknowledgement LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many alert acknowledgement in each?
SELECT time, COUNT(*) as count FROM alert_acknowledgement GROUP BY time;

-- 11. [MEDIUM] Are there any alert acknowledgement that don't have a match somewhere else?
SELECT * FROM alert_acknowledgement LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY polumorphic_ctype ORDER BY id DESC) as rn
  FROM alert_plugin
) WHERE rn <= 3;

-- 13. [MEDIUM] Show me each alert plugin along with its related details.
SELECT * FROM alert_acknowledgement;

-- 14. [MEDIUM] Break it down by type or category—how many alert plugin in each?
SELECT time, COUNT(*) as count FROM alert_acknowledgement GROUP BY time;

-- 15. [MEDIUM] Are there any alert plugin that don't have a match somewhere else?
SELECT * FROM alert_acknowledgement LIMIT 10;

-- 16. [MEDIUM] Break it down by type or category—how many users in each?
SELECT time, COUNT(*) as count FROM alert_acknowledgement GROUP BY time;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM alert_acknowledgement;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT time, COUNT(*) as cnt FROM alert_acknowledgement GROUP BY time
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY time ORDER BY id DESC) as rn
  FROM alert_acknowledgement
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM status_check t1
WHERE value > (
  SELECT AVG(value) FROM status_check t2 WHERE t2.check_type = t1.check_type
);


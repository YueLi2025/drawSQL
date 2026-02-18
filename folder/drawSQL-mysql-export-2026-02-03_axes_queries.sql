-- SQLite queries for: drawSQL-mysql-export-2026-02-03_axes
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM axes_accessattempt
WHERE path_info >= date('now', '-1 month');

-- 2. [EASY] How many axes accessattempt do we have?
SELECT COUNT(*) FROM axes_accessattempt;

-- 3. [EASY] Show me all of our axes accessattempt.
SELECT * FROM axes_accessattempt;

-- 4. [EASY] Can you look up a specific axes accessattempt?
SELECT * FROM axes_accessattempt WHERE id = ?;

-- 5. [EASY] Find the axes accessattempt with a certain name or email.
SELECT * FROM axes_accessattempt WHERE username = ?;

-- 6. [EASY] What are the different user agent values we have?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 7. [EASY] How many axes accesslog do we have?
SELECT COUNT(*) FROM axes_accessattempt;

-- 8. [EASY] Show me all of our axes accesslog.
SELECT * FROM axes_accessattempt;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many axes accessattempt in each?
SELECT user_agent, COUNT(*) as count FROM axes_accessattempt GROUP BY user_agent;

-- 11. [MEDIUM] Are there any axes accessattempt that don't have a match somewhere else?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 13. [MEDIUM] Break it down by type or category—how many axes accesslog in each?
SELECT user_agent, COUNT(*) as count FROM axes_accessattempt GROUP BY user_agent;

-- 14. [MEDIUM] Are there any axes accesslog that don't have a match somewhere else?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 15. [MEDIUM] Are there any that exist in one list but not the other?
SELECT * FROM axes_accessattempt LIMIT 10;

-- 16. [MEDIUM] How did the numbers change compared to last month?
SELECT
  strftime('%Y-%m', path_info) as period,
  COUNT(*) as count
FROM axes_accessattempt
WHERE path_info >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM axes_accessattempt;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_agent, COUNT(*) as cnt FROM axes_accessattempt GROUP BY user_agent
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_agent ORDER BY id DESC) as rn
  FROM axes_accessattempt
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM axes_accessattempt LIMIT 10;


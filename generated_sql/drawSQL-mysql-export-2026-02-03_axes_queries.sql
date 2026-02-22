-- SQLite queries for: drawSQL-mysql-export-2026-02-03_axes
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM axes_accessattempt
WHERE path_info >= date('now', '-1 month');

-- 2. [EASY] How many axes accessattempt do we have in total?
SELECT COUNT(*) FROM axes_accessattempt;

-- 3. [EASY] Show me all of our axes accessattempt.
SELECT * FROM axes_accessattempt;

-- 4. [EASY] Can you look up the axes accessattempt with id=num?
SELECT * FROM axes_accessattempt WHERE id = num;

-- 5. [EASY] Find the axes accessattempt where username=string.
SELECT * FROM axes_accessattempt WHERE username = string;

-- 6. [EASY] How many axes accessattempt were created since path_info=date?
SELECT COUNT(*) FROM axes_accessattempt
WHERE path_info >= date('now', '-1 month');

-- 7. [EASY] What are the most recent axes accessattempt ordered by user_agent?
SELECT * FROM axes_accessattempt ORDER BY path_info DESC LIMIT num;

-- 8. [EASY] How many axes accesslog do we have in total?
SELECT COUNT(*) FROM axes_accesslog;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM axes_accessattempt LIMIT num;

-- 10. [MEDIUM] How many axes accessattempt were added since path_info=date?
SELECT COUNT(*) FROM axes_accessattempt
WHERE path_info >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the axes accessattempt by user_agent — how many in each?
SELECT user_agent, COUNT(*) as count FROM axes_accessattempt GROUP BY user_agent;

-- 12. [MEDIUM] Are there any axes accessattempt that don't have a match in related tables?
SELECT * FROM axes_accessattempt LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 axes accessattempt?
SELECT * FROM axes_accessattempt ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of axes accessattempt change month over month?
SELECT
  strftime('%Y-%m', path_info) as period,
  COUNT(*) as count
FROM axes_accessattempt
WHERE path_info >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which axes accessattempt have duplicate or repeated values?
WITH grouped AS (
  SELECT user_agent, COUNT(*) as cnt FROM axes_accessattempt GROUP BY user_agent
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many axes accesslog were added since path_info=date?
SELECT COUNT(*) FROM axes_accesslog
WHERE path_info >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on axes accessattempt joining all related tables.
SELECT * FROM axes_accessattempt;

-- 18. [HARD] Who or what is the best in each group of axes accessattempt?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_agent ORDER BY id DESC) as rn
  FROM axes_accessattempt
) WHERE rn = num;

-- 19. [HARD] Which axes accessattempt are above average compared to others in their group?
SELECT
  strftime('%Y-%m', path_info) as period,
  COUNT(*) as count
FROM axes_accessattempt
WHERE path_info >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group axes accessattempt, filter, then rank the results.
WITH grouped AS (
  SELECT user_agent, COUNT(*) as cnt FROM axes_accessattempt GROUP BY user_agent
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of axes accessattempt over time based on path_info.
SELECT *, COUNT(*) OVER (ORDER BY path_info) as running_count
FROM axes_accessattempt
ORDER BY path_info;

-- 22. [HARD] Find axes accessattempt that exist in one table but not in a related table.
SELECT * FROM axes_accessattempt LIMIT num;

-- 23. [HARD] Rank all axes accessattempt within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM axes_accessattempt;

-- 24. [HARD] Pull together a report on axes accesslog joining all related tables.
SELECT * FROM axes_accessattempt;


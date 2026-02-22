-- SQLite queries for: drawSQL-mysql-export-2026-01-13_laravelspark
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT team_id, COUNT(*) as member_count FROM team_subscriptions GROUP BY team_id;

-- 3. [EASY] How many announcements do we have in total?
SELECT COUNT(*) FROM announcements;

-- 4. [EASY] Show me all of our announcements.
SELECT * FROM announcements;

-- 5. [EASY] Can you look up the announcement with id=num?
SELECT * FROM announcements WHERE id = num;

-- 6. [EASY] How many announcements were created since created_at=date?
SELECT COUNT(*) FROM announcements
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent announcements ordered by user_id?
SELECT * FROM announcements ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many api tokens do we have in total?
SELECT COUNT(*) FROM api_tokens;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many announcements were added since created_at=date?
SELECT COUNT(*) FROM announcements
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the announcements by user_id — how many in each?
SELECT user_id, COUNT(*) as count FROM announcements GROUP BY user_id;

-- 12. [MEDIUM] Are there any announcements that don't have a match in related tables?
SELECT * FROM announcements LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 announcements?
SELECT * FROM announcements ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of announcements change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM announcements
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which announcements have duplicate or repeated values?
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM announcements GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many api tokens were added since created_at=date?
SELECT COUNT(*) FROM api_tokens
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on announcements joining all related tables.
SELECT * FROM announcements
LEFT JOIN users ON announcements.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of announcements?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY id DESC) as rn
  FROM announcements
) WHERE rn = num;

-- 19. [HARD] Which announcements are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM announcements
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group announcements, filter, then rank the results.
WITH grouped AS (
  SELECT user_id, COUNT(*) as cnt FROM announcements GROUP BY user_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of announcements over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM announcements
ORDER BY created_at;

-- 22. [HARD] Find announcements that exist in one table but not in a related table.
SELECT * FROM announcements LIMIT num;

-- 23. [HARD] Combine data from announcements, api_tokens, and invitations in a single report.
SELECT * FROM announcements
LEFT JOIN api_tokens ON api_tokens.id = announcements.id
LEFT JOIN invitations ON invitations.id = announcements.id;

-- 24. [HARD] Rank all announcements within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM announcements;


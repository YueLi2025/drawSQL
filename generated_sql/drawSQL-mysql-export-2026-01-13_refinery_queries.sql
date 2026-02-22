-- SQLite queries for: drawSQL-mysql-export-2026-01-13_refinery
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many ticketit statuses do we have in total?
SELECT COUNT(*) FROM ticketit_statuses;

-- 3. [EASY] Show me all of our ticketit statuses.
SELECT * FROM ticketit_statuses;

-- 4. [EASY] Can you look up the ticketit status with id=num?
SELECT * FROM ticketit WHERE id = num;

-- 5. [EASY] Find the ticketit status where name=string.
SELECT * FROM ticketit LIMIT num;

-- 6. [EASY] What are the most recent ticketit statuses ordered by name?
SELECT * FROM ticketit_statuses ORDER BY name DESC LIMIT num;

-- 7. [EASY] How many ticketit priorities do we have in total?
SELECT COUNT(*) FROM ticketit_priorities;

-- 8. [EASY] Show me all of our ticketit priorities.
SELECT * FROM ticketit_priorities;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each ticketit status along with its related details from other tables.
SELECT t.*, c.*
FROM ticketit t
LEFT JOIN ticketit_comments c ON c.ticket_id = t.id;

-- 11. [MEDIUM] Break down the ticketit statuses by name — how many in each?
SELECT name, COUNT(*) as count FROM ticketit_statuses GROUP BY name;

-- 12. [MEDIUM] Are there any ticketit statuses that don't have a match in related tables?
SELECT * FROM ticketit_statuses
WHERE id NOT IN (SELECT DISTINCT status_id FROM ticketit WHERE status_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 ticketit statuses?
SELECT * FROM ticketit_statuses ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] Which ticketit statuses have duplicate or repeated values?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM ticketit_statuses GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 15. [MEDIUM] Show me each ticketit priority along with its related details from other tables.
SELECT t.*, c.*
FROM ticketit t
LEFT JOIN ticketit_comments c ON c.ticket_id = t.id;

-- 16. [MEDIUM] Break down the ticketit priorities by name — how many in each?
SELECT name, COUNT(*) as count FROM ticketit_priorities GROUP BY name;

-- 17. [HARD] Pull together a report on ticketit statuses joining all related tables.
SELECT * FROM ticketit_categories_users
LEFT JOIN users ON ticketit_categories_users.user_id = users.id
LEFT JOIN ticketit_categories ON ticketit_categories_users.category_id = ticketit_categories.id;

-- 18. [HARD] Who or what is the best in each group of ticketit statuses?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM ticketit_statuses
) WHERE rn = num;

-- 19. [HARD] Which ticketit statuses are above average compared to others in their group?
SELECT * FROM ticketit_settings
WHERE value > (SELECT AVG(value) FROM ticketit_settings);

-- 20. [HARD] Do a multi-step analysis: group ticketit statuses, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM ticketit_statuses GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find ticketit statuses that exist in one table but not in a related table.
SELECT * FROM ticketit_statuses
WHERE id NOT IN (SELECT DISTINCT status_id FROM ticketit WHERE status_id IS NOT NULL);

-- 22. [HARD] Combine data from ticketit_statuses, ticketit_priorities, and ticketit_categories in a single report.
SELECT * FROM ticketit_statuses
LEFT JOIN ticketit_priorities ON ticketit_priorities.id = ticketit_statuses.status_id
LEFT JOIN ticketit_categories ON ticketit_categories.id = ticketit_statuses.category_id
LEFT JOIN ticketit ON ticketit.id = ticketit_statuses.status_id;

-- 23. [HARD] Rank all ticketit statuses within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM ticketit_statuses;

-- 24. [HARD] Pull together a report on ticketit priorities joining all related tables.
SELECT * FROM ticketit_categories_users
LEFT JOIN users ON ticketit_categories_users.user_id = users.id
LEFT JOIN ticketit_categories ON ticketit_categories_users.category_id = ticketit_categories.id;


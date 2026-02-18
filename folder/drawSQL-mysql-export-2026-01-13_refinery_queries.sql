-- SQLite queries for: drawSQL-mysql-export-2026-01-13_refinery
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many ticketit statuses do we have?
SELECT COUNT(*) FROM ticketit_statuses;

-- 3. [EASY] Show me all of our ticketit statuses.
SELECT * FROM ticketit_statuses;

-- 4. [EASY] Can you look up a specific ticketit status?
SELECT * FROM ticketit_statuses WHERE id = ?;

-- 5. [EASY] Find the ticketit status with a certain name or email.
SELECT * FROM ticketit_statuses WHERE name = ?;

-- 6. [EASY] What are the different name values we have?
SELECT * FROM ticketit_statuses LIMIT 10;

-- 7. [EASY] How many ticketit priorities do we have?
SELECT COUNT(*) FROM ticketit_statuses;

-- 8. [EASY] Show me all of our ticketit priorities.
SELECT * FROM ticketit_statuses;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each ticketit status along with its related details.
SELECT t.*, c.*
FROM ticketit_statuses t
LEFT JOIN ticketit c ON c.status_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many ticketit statuses in each?
SELECT name, COUNT(*) as count FROM ticketit_statuses GROUP BY name;

-- 12. [MEDIUM] Are there any ticketit statuses that don't have a match somewhere else?
SELECT * FROM ticketit_statuses
WHERE id NOT IN (SELECT DISTINCT status_id FROM ticketit WHERE status_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM ticketit_statuses LIMIT 10;

-- 14. [MEDIUM] Show me each ticketit priority along with its related details.
SELECT t.*, c.*
FROM ticketit_statuses t
LEFT JOIN ticketit c ON c.status_id = t.id;

-- 15. [MEDIUM] Break it down by type or category—how many ticketit priorities in each?
SELECT name, COUNT(*) as count FROM ticketit_statuses GROUP BY name;

-- 16. [MEDIUM] Are there any ticketit priorities that don't have a match somewhere else?
SELECT * FROM ticketit_statuses
WHERE id NOT IN (SELECT DISTINCT status_id FROM ticketit WHERE status_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM ticketit_categories_users
LEFT JOIN users ON ticketit_categories_users.user_id = users.id
LEFT JOIN ticketit_categories ON ticketit_categories_users.category_id = ticketit_categories.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM ticketit_statuses GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM ticketit_statuses
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM ticketit_settings
WHERE value > (SELECT AVG(value) FROM ticketit_settings);


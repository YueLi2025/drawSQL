-- SQLite queries for: drawSQL-mysql-export-2026-02-09_streaks
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM users WHERE id = ?;

-- 5. [EASY] What are the different level id values we have?
SELECT * FROM users LIMIT 10;

-- 6. [EASY] How many streaks do we have?
SELECT COUNT(*) FROM users;

-- 7. [EASY] Show me all of our streaks.
SELECT * FROM users;

-- 8. [EASY] Can you look up a specific streak?
SELECT * FROM users WHERE id = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN streaks c ON c.user_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT level_id, COUNT(*) as count FROM users GROUP BY level_id;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM streaks WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM users LIMIT 10;

-- 14. [MEDIUM] How many streaks did we have last month?
SELECT COUNT(*) FROM streaks
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many streaks in each?
SELECT level_id, COUNT(*) as count FROM users GROUP BY level_id;

-- 16. [MEDIUM] Are there any streaks that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM streaks WHERE user_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM streaks
LEFT JOIN users ON streaks.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT level_id, COUNT(*) as cnt FROM users GROUP BY level_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY level_id ORDER BY id DESC) as rn
  FROM users
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM users LIMIT 10;


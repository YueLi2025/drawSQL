-- SQLite queries for: drawSQL-mysql-export-2026-02-09_streaks
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 3. [EASY] Show me all of our users.
SELECT * FROM users;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM users WHERE id = num;

-- 5. [EASY] What are the most recent users ordered by level_id?
SELECT * FROM users ORDER BY level_id DESC LIMIT num;

-- 6. [EASY] How many streaks do we have in total?
SELECT COUNT(*) FROM streaks;

-- 7. [EASY] Show me all of our streaks.
SELECT * FROM streaks;

-- 8. [EASY] Can you look up the streak with id=num?
SELECT * FROM users WHERE id = num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM users t
LEFT JOIN streaks c ON c.user_id = t.id;

-- 11. [MEDIUM] Break down the users by level_id — how many in each?
SELECT COUNT(*) FROM users;

-- 12. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM streaks WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT level_id, COUNT(*) as cnt FROM users GROUP BY level_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 15. [MEDIUM] How many streaks were added since created_at=date?
SELECT COUNT(*) FROM streaks
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break down the streaks by user_id — how many in each?
SELECT user_id, COUNT(*) as count FROM streaks GROUP BY user_id;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM streaks
LEFT JOIN users ON streaks.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY level_id ORDER BY id DESC) as rn
  FROM users
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT * FROM users LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT level_id, COUNT(*) as cnt FROM users GROUP BY level_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM streaks WHERE user_id IS NOT NULL);

-- 22. [HARD] Combine data from users, streaks, and streak_histories in a single report.
SELECT * FROM users
LEFT JOIN streaks ON streaks.id = users.user_id
LEFT JOIN streak_histories ON streak_histories.id = users.user_id;

-- 23. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;

-- 24. [HARD] Pull together a report on streaks joining all related tables.
SELECT * FROM streaks
LEFT JOIN users ON streaks.user_id = users.id;


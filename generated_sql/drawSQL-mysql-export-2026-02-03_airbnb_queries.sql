-- SQLite queries for: drawSQL-mysql-export-2026-02-03_airbnb
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms have price between num and num?
SELECT * FROM rooms WHERE price BETWEEN num AND num ORDER BY price;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM users;

-- 4. [EASY] Show me all of our users.
SELECT * FROM users;

-- 5. [EASY] Can you look up the user with id=num?
SELECT * FROM users WHERE id = num;

-- 6. [EASY] Find the user where name=string.
SELECT * FROM users WHERE name = string;

-- 7. [EASY] How many users were created since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent users ordered by name?
SELECT * FROM users ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] How much total revenue from reservations since created_at=date?
SELECT SUM(price) as total_revenue FROM reservations
WHERE start_date >= date('now', '-1 month');

-- 10. [MEDIUM] Which rooms have the best average rating?
SELECT r.*, AVG(rev.rating) as avg_rating
FROM rooms r
JOIN reservations res ON res.room_id = r.id
JOIN reviews rev ON rev.reservation_id = res.id
GROUP BY r.id
ORDER BY avg_rating DESC;

-- 11. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 12. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM users t
LEFT JOIN reservations c ON c.user_id = t.id;

-- 13. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 14. [MEDIUM] Break down the users by name — how many in each?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM reservations WHERE user_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM users ORDER BY id DESC LIMIT num;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM media
LEFT JOIN reviews ON media.model_id = reviews.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM users
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM users
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM users GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM users
ORDER BY created_at;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM reservations WHERE user_id IS NOT NULL);

-- 23. [HARD] Combine data from users, rooms, and reservations in a single report.
SELECT * FROM users
LEFT JOIN rooms ON rooms.id = users.user_id
LEFT JOIN reservations ON reservations.id = users.user_id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM users;


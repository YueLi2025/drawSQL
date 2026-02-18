-- SQLite queries for: drawSQL-mysql-export-2026-02-03_airbnb
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms are available in a certain price range?
SELECT * FROM rooms WHERE price BETWEEN ? AND ? ORDER BY price;

-- 2. [EASY] Which rooms have the most bedrooms or bathrooms?
SELECT * FROM rooms ORDER BY total_bedrooms DESC, total_bathrooms DESC LIMIT 10;

-- 3. [EASY] What reservations do we have coming up?
SELECT * FROM reservations
WHERE start_date >= date('now')
ORDER BY start_date ASC;

-- 4. [EASY] What do guests think of our rooms? What are the ratings?
SELECT r.*, AVG(r.rating) as avg_rating FROM reviews r GROUP BY r.reservation_id;

-- 5. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] How many users do we have?
SELECT COUNT(*) FROM users;

-- 7. [EASY] Show me all of our users.
SELECT * FROM users;

-- 8. [EASY] Can you look up a specific user?
SELECT * FROM users WHERE id = ?;

-- 9. [MEDIUM] How much revenue did we make from reservations last month?
SELECT SUM(total) as total_revenue FROM reservations
WHERE created_at >= date('now', '-1 month');

-- 10. [MEDIUM] Which rooms have the best reviews?
SELECT r.*, AVG(rev.rating) as avg_rating
FROM rooms r
JOIN reservations res ON res.room_id = r.id
JOIN reviews rev ON rev.reservation_id = res.id
GROUP BY r.id
ORDER BY avg_rating DESC;

-- 11. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 12. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM users t
LEFT JOIN reservations c ON c.user_id = t.id;

-- 13. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 14. [MEDIUM] Break it down by type or category—how many users in each?
SELECT name, COUNT(*) as count FROM users GROUP BY name;

-- 15. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM reservations WHERE user_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY home_type ORDER BY price DESC) as rn
  FROM rooms
) WHERE rn <= 3;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM media
LEFT JOIN reviews ON media.model_id = reviews.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM users GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY home_type ORDER BY price DESC) as rn
  FROM rooms
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM rooms t1
WHERE price > (
  SELECT AVG(price) FROM rooms t2 WHERE t2.home_type = t1.home_type
);


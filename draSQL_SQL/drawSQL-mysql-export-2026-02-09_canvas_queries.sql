-- SQLite queries for: drawSQL-mysql-export-2026-02-09_canvas
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many posts do we have?
SELECT COUNT(*) FROM canvas_posts;

-- 3. [EASY] Show me all of our posts.
SELECT * FROM canvas_posts;

-- 4. [EASY] Can you look up a specific post?
SELECT * FROM canvas_posts WHERE id = ?;

-- 5. [EASY] Find the post with a certain name or email.
SELECT * FROM canvas_posts LIMIT 10;

-- 6. [EASY] What posts were added or changed recently?
SELECT * FROM canvas_posts ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different slug values we have?
SELECT * FROM canvas_posts LIMIT 10;

-- 8. [EASY] What are the different tag id values we have?
SELECT * FROM canvas_posts LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each post along with its related details.
SELECT t.*, c.*
FROM canvas_posts t
LEFT JOIN canvas_posts_tags c ON c.post_id = t.id;

-- 11. [MEDIUM] How many posts did we have last month?
SELECT COUNT(*) FROM canvas_posts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many posts in each?
SELECT slug, COUNT(*) as count FROM canvas_posts GROUP BY slug;

-- 13. [MEDIUM] Are there any posts that don't have a match somewhere else?
SELECT * FROM canvas_posts
WHERE id NOT IN (SELECT DISTINCT post_id FROM canvas_posts_tags WHERE post_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM canvas_posts LIMIT 10;

-- 15. [MEDIUM] Show me each tag along with its related details.
SELECT t.*, c.*
FROM canvas_posts t
LEFT JOIN canvas_posts_tags c ON c.post_id = t.id;

-- 16. [MEDIUM] How many tags did we have last month?
SELECT COUNT(*) FROM canvas_posts
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM canvas_posts_tags
LEFT JOIN canvas_posts ON canvas_posts_tags.post_id = canvas_posts.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT slug, COUNT(*) as cnt FROM canvas_posts GROUP BY slug
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY slug ORDER BY id DESC) as rn
  FROM canvas_posts
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM canvas_posts LIMIT 10;


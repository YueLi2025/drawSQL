-- SQLite queries for: drawSQL-mysql-export-2026-02-09_canvas
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many posts do we have in total?
SELECT COUNT(*) FROM canvas_posts;

-- 3. [EASY] Show me all of our posts.
SELECT * FROM canvas_posts;

-- 4. [EASY] Can you look up the post with id=num?
SELECT * FROM canvas_posts WHERE id = num;

-- 5. [EASY] Find the post where title=string.
SELECT * FROM canvas_posts WHERE title = string;

-- 6. [EASY] How many posts were created since created_at=date?
SELECT COUNT(*) FROM canvas_posts
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent posts ordered by slug?
SELECT * FROM canvas_posts ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] What are the most recent posts ordered by tag_id?
SELECT * FROM canvas_posts ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each post along with its related details from other tables.
SELECT t.*, c.*
FROM canvas_posts t
LEFT JOIN canvas_posts_tags c ON c.post_id = t.id;

-- 11. [MEDIUM] How many posts were added since created_at=date?
SELECT COUNT(*) FROM canvas_posts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the posts by slug — how many in each?
SELECT slug, COUNT(*) as count FROM canvas_posts GROUP BY slug;

-- 13. [MEDIUM] Are there any posts that don't have a match in related tables?
SELECT * FROM canvas_posts
WHERE id NOT IN (SELECT DISTINCT post_id FROM canvas_posts_tags WHERE post_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 posts?
SELECT * FROM canvas_posts ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of posts change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM canvas_posts
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which posts have duplicate or repeated values?
WITH grouped AS (
  SELECT slug, COUNT(*) as cnt FROM canvas_posts GROUP BY slug
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on posts joining all related tables.
SELECT * FROM canvas_posts_tags
LEFT JOIN canvas_posts ON canvas_posts_tags.post_id = canvas_posts.id;

-- 18. [HARD] Who or what is the best in each group of posts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY slug ORDER BY id DESC) as rn
  FROM canvas_posts
) WHERE rn = num;

-- 19. [HARD] Which posts are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM canvas_posts
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group posts, filter, then rank the results.
WITH grouped AS (
  SELECT slug, COUNT(*) as cnt FROM canvas_posts GROUP BY slug
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of posts over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM canvas_posts
ORDER BY created_at;

-- 22. [HARD] Find posts that exist in one table but not in a related table.
SELECT * FROM canvas_posts
WHERE id NOT IN (SELECT DISTINCT post_id FROM canvas_posts_tags WHERE post_id IS NOT NULL);

-- 23. [HARD] Combine data from canvas_posts, canvas_posts_tags, and canvas_posts_topics in a single report.
SELECT * FROM canvas_posts
LEFT JOIN canvas_posts_tags ON canvas_posts_tags.id = canvas_posts.post_id
LEFT JOIN canvas_posts_topics ON canvas_posts_topics.id = canvas_posts.post_id;

-- 24. [HARD] Rank all posts within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM canvas_posts;


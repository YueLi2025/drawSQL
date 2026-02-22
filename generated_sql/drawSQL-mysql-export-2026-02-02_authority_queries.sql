-- SQLite queries for: drawSQL-mysql-export-2026-02-02_authority
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many authority permission do we have in total?
SELECT COUNT(*) FROM authority_permission;

-- 3. [EASY] Show me all of our authority permission.
SELECT * FROM authority_permission;

-- 4. [EASY] Can you look up the authority permission with id=num?
SELECT * FROM authority_permission WHERE id = num;

-- 5. [EASY] Find the authority permission where codename=string.
SELECT * FROM authority_permission WHERE codename = string;

-- 6. [EASY] How many authority permission were created since date_requested=date?
SELECT COUNT(*) FROM authority_permission
WHERE date_requested >= date('now', '-1 month');

-- 7. [EASY] What are the most recent authority permission ordered by codename?
SELECT * FROM authority_permission ORDER BY date_requested DESC LIMIT num;

-- 8. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM auth_user;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many authority permission were added since date_requested=date?
SELECT COUNT(*) FROM authority_permission
WHERE date_requested >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the authority permission by content_type_id — how many in each?
SELECT content_type_id, COUNT(*) as count FROM authority_permission GROUP BY content_type_id;

-- 12. [MEDIUM] Are there any authority permission that don't have a match in related tables?
SELECT * FROM authority_permission LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 authority permission?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM authority_permission
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of authority permission change month over month?
SELECT
  strftime('%Y-%m', date_requested) as period,
  COUNT(*) as count
FROM authority_permission
WHERE date_requested >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which authority permission have duplicate or repeated values?
WITH grouped AS (
  SELECT content_type_id, COUNT(*) as cnt FROM authority_permission GROUP BY content_type_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each user along with its related details from other tables.
SELECT * FROM authority_permission;

-- 17. [HARD] Pull together a report on authority permission joining all related tables.
SELECT * FROM authority_permission
LEFT JOIN django_content_type ON authority_permission.content_type_id = django_content_type.id
LEFT JOIN auth_group ON authority_permission.group_id = auth_group.id
LEFT JOIN auth_user ON authority_permission.user_id = auth_user.id;

-- 18. [HARD] Who or what is the best in each group of authority permission?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM authority_permission
) WHERE rn = num;

-- 19. [HARD] Which authority permission are above average compared to others in their group?
SELECT
  strftime('%Y-%m', date_requested) as period,
  COUNT(*) as count
FROM authority_permission
WHERE date_requested >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group authority permission, filter, then rank the results.
WITH grouped AS (
  SELECT content_type_id, COUNT(*) as cnt FROM authority_permission GROUP BY content_type_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of authority permission over time based on date_requested.
SELECT *, COUNT(*) OVER (ORDER BY date_requested) as running_count
FROM authority_permission
ORDER BY date_requested;

-- 22. [HARD] Find authority permission that exist in one table but not in a related table.
SELECT * FROM authority_permission LIMIT num;

-- 23. [HARD] Combine data from authority_permission, auth_user, and auth_group in a single report.
SELECT * FROM authority_permission
LEFT JOIN auth_user ON auth_user.id = authority_permission.user_id
LEFT JOIN auth_group ON auth_group.id = authority_permission.group_id;

-- 24. [HARD] Rank all authority permission within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM authority_permission
) WHERE rn <= num;


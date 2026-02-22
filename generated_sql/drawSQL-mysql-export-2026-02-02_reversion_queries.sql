-- SQLite queries for: drawSQL-mysql-export-2026-02-02_reversion
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM auth_user;

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM auth_user;

-- 3. [EASY] Show me all of our users.
SELECT * FROM auth_user;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM auth_user WHERE id = num;

-- 5. [EASY] How many reversion revision do we have in total?
SELECT COUNT(*) FROM reversion_revision;

-- 6. [EASY] Show me all of our reversion revision.
SELECT * FROM reversion_revision;

-- 7. [EASY] Can you look up the reversion revision with id=num?
SELECT * FROM reversion_revision WHERE id = num;

-- 8. [EASY] How many reversion revision were created since date_created=date?
SELECT COUNT(*) FROM reversion_revision
WHERE date_created >= date('now', '-1 month');

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN reversion_revision c ON c.user_id = t.id;

-- 11. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM reversion_revision WHERE user_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM auth_user ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which users have duplicate or repeated values?
SELECT * FROM auth_user LIMIT num;

-- 14. [MEDIUM] Show me each reversion revision along with its related details from other tables.
SELECT t.*, c.*
FROM reversion_revision t
LEFT JOIN reversion_version c ON c.revision_id = t.id;

-- 15. [MEDIUM] How many reversion revision were added since date_created=date?
SELECT COUNT(*) FROM reversion_revision
WHERE date_created >= date('now', '-1 month');

-- 16. [MEDIUM] Break down the reversion revision by date_created — how many in each?
SELECT date_created, COUNT(*) as count FROM reversion_revision GROUP BY date_created;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM reversion_version
LEFT JOIN reversion_revision ON reversion_version.revision_id = reversion_revision.id
LEFT JOIN django_content_type ON reversion_version.content_type_id = django_content_type.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY id ORDER BY id DESC) as rn
  FROM auth_user
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT * FROM auth_user LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT id, COUNT(*) as cnt FROM auth_user GROUP BY id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM reversion_revision WHERE user_id IS NOT NULL);

-- 22. [HARD] Combine data from auth_user, reversion_revision, and reversion_version in a single report.
SELECT * FROM auth_user
LEFT JOIN reversion_revision ON reversion_revision.id = auth_user.user_id
LEFT JOIN reversion_version ON reversion_version.id = auth_user.user_id;

-- 23. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM auth_user;

-- 24. [HARD] Pull together a report on reversion revision joining all related tables.
SELECT * FROM reversion_version
LEFT JOIN reversion_revision ON reversion_version.revision_id = reversion_revision.id
LEFT JOIN django_content_type ON reversion_version.content_type_id = django_content_type.id;


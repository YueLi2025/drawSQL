-- SQLite queries for: drawSQL-mysql-export-2026-02-02_reversion
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM reversion_revision
WHERE date_created >= date('now', '-1 month');

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM auth_user;

-- 3. [EASY] Show me all of our users.
SELECT * FROM auth_user;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM auth_user WHERE id = ?;

-- 5. [EASY] How many reversion revision do we have?
SELECT COUNT(*) FROM auth_user;

-- 6. [EASY] Show me all of our reversion revision.
SELECT * FROM auth_user;

-- 7. [EASY] Can you look up a specific reversion revision?
SELECT * FROM auth_user WHERE id = ?;

-- 8. [EASY] What reversion revision were added or changed recently?
SELECT * FROM reversion_revision ORDER BY date_created DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM auth_user LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN reversion_revision c ON c.user_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT date_created, COUNT(*) as count FROM reversion_revision GROUP BY date_created;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM reversion_revision WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM auth_user LIMIT 10;

-- 14. [MEDIUM] Show me each reversion revision along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN reversion_revision c ON c.user_id = t.id;

-- 15. [MEDIUM] How many reversion revision did we have last month?
SELECT COUNT(*) FROM reversion_revision
WHERE date_created >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many reversion revision in each?
SELECT date_created, COUNT(*) as count FROM reversion_revision GROUP BY date_created;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM reversion_version
LEFT JOIN reversion_revision ON reversion_version.revision_id = reversion_revision.id
LEFT JOIN django_content_type ON reversion_version.content_type_id = django_content_type.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT id, COUNT(*) as cnt FROM auth_user GROUP BY id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY id ORDER BY id DESC) as rn
  FROM auth_user
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM auth_user LIMIT 10;


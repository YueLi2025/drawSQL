-- SQLite queries for: drawSQL-mysql-export-2026-02-02_authority
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM authority_permission
WHERE date_requested >= date('now', '-1 month');

-- 2. [EASY] How many authority permission do we have?
SELECT COUNT(*) FROM authority_permission;

-- 3. [EASY] Show me all of our authority permission.
SELECT * FROM authority_permission;

-- 4. [EASY] Can you look up a specific authority permission?
SELECT * FROM authority_permission WHERE id = ?;

-- 5. [EASY] Find the authority permission with a certain name or email.
SELECT * FROM authority_permission WHERE codename = ?;

-- 6. [EASY] What authority permission were added or changed recently?
SELECT * FROM authority_permission ORDER BY date_requested DESC LIMIT 50;

-- 7. [EASY] What are the different codename values we have?
SELECT * FROM authority_permission LIMIT 10;

-- 8. [EASY] How many users do we have?
SELECT COUNT(*) FROM authority_permission;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM authority_permission LIMIT 10;

-- 10. [MEDIUM] How many authority permission did we have last month?
SELECT COUNT(*) FROM authority_permission
WHERE date_requested >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many authority permission in each?
SELECT content_type_id, COUNT(*) as count FROM authority_permission GROUP BY content_type_id;

-- 12. [MEDIUM] Are there any authority permission that don't have a match somewhere else?
SELECT * FROM authority_permission LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM authority_permission
) WHERE rn <= 3;

-- 14. [MEDIUM] Show me each user along with its related details.
SELECT * FROM authority_permission;

-- 15. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM authority_permission
WHERE date_requested >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many users in each?
SELECT content_type_id, COUNT(*) as count FROM authority_permission GROUP BY content_type_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM authority_permission
LEFT JOIN django_content_type ON authority_permission.content_type_id = django_content_type.id
LEFT JOIN auth_group ON authority_permission.group_id = auth_group.id
LEFT JOIN auth_user ON authority_permission.user_id = auth_user.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT content_type_id, COUNT(*) as cnt FROM authority_permission GROUP BY content_type_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY content_type_id ORDER BY id DESC) as rn
  FROM authority_permission
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM authority_permission LIMIT 10;


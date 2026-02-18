-- SQLite queries for: drawSQL-mysql-export-2026-02-03_filer
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many auth group do we have?
SELECT COUNT(*) FROM auth_group;

-- 3. [EASY] Show me all of our auth group.
SELECT * FROM auth_group;

-- 4. [EASY] Can you look up a specific auth group?
SELECT * FROM auth_group WHERE id = ?;

-- 5. [EASY] Find the auth group with a certain name or email.
SELECT * FROM auth_group WHERE name = ?;

-- 6. [EASY] What are the different name values we have?
SELECT * FROM auth_group LIMIT 10;

-- 7. [EASY] How many users do we have?
SELECT COUNT(*) FROM auth_group;

-- 8. [EASY] Show me all of our users.
SELECT * FROM auth_group;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM auth_group LIMIT 10;

-- 10. [MEDIUM] Show me each auth group along with its related details.
SELECT t.*, c.*
FROM auth_group t
LEFT JOIN filer_folderpermission c ON c.group_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many auth group in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 12. [MEDIUM] Are there any auth group that don't have a match somewhere else?
SELECT * FROM auth_group
WHERE id NOT IN (SELECT DISTINCT group_id FROM filer_folderpermission WHERE group_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM auth_group LIMIT 10;

-- 14. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM auth_group t
LEFT JOIN filer_folderpermission c ON c.group_id = t.id;

-- 15. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many users in each?
SELECT name, COUNT(*) as count FROM auth_group GROUP BY name;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM filer_file
LEFT JOIN auth_user ON filer_file.owner_id = auth_user.id
LEFT JOIN django_content_type ON filer_file.polymorphic_ctype_id = django_content_type.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM auth_group GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM auth_group
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM auth_group LIMIT 10;


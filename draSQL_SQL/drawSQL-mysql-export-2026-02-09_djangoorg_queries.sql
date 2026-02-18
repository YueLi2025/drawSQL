-- SQLite queries for: drawSQL-mysql-export-2026-02-09_djangoorg
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM organizations_organization
WHERE created >= date('now', '-1 month');

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM auth_user;

-- 3. [EASY] Show me all of our users.
SELECT * FROM auth_user;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM auth_user WHERE id = ?;

-- 5. [EASY] How many organizations organization do we have?
SELECT COUNT(*) FROM auth_user;

-- 6. [EASY] Show me all of our organizations organization.
SELECT * FROM auth_user;

-- 7. [EASY] Can you look up a specific organizations organization?
SELECT * FROM auth_user WHERE id = ?;

-- 8. [EASY] Find the organizations organization with a certain name or email.
SELECT * FROM organizations_organization WHERE name = ?;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM auth_user LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN organizations_organizationuser c ON c.user_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many users in each?
SELECT name, COUNT(*) as count FROM organizations_organization GROUP BY name;

-- 12. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM organizations_organizationuser WHERE user_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM auth_user LIMIT 10;

-- 14. [MEDIUM] Show me each organizations organization along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN organizations_organizationuser c ON c.user_id = t.id;

-- 15. [MEDIUM] Break it down by type or category—how many organizations organization in each?
SELECT name, COUNT(*) as count FROM organizations_organization GROUP BY name;

-- 16. [MEDIUM] Are there any organizations organization that don't have a match somewhere else?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM organizations_organizationuser WHERE user_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM organizations_organizationowner
LEFT JOIN organizations_organization ON organizations_organizationowner.organization_id = organizations_organization.id
LEFT JOIN organizations_organizationuser ON organizations_organizationowner.organization_user_id = organizations_organizationuser.id;

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


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_djangoorg
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

-- 5. [EASY] How many organizations organization do we have in total?
SELECT COUNT(*) FROM organizations_organization;

-- 6. [EASY] Show me all of our organizations organization.
SELECT * FROM organizations_organization;

-- 7. [EASY] Can you look up the organizations organization with id=num?
SELECT * FROM organizations_organization WHERE id = num;

-- 8. [EASY] Find the organizations organization where name=string.
SELECT * FROM organizations_organization WHERE name = string;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN organizations_organizationuser c ON c.user_id = t.id;

-- 11. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM organizations_organizationuser WHERE user_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM auth_user ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which users have duplicate or repeated values?
SELECT * FROM auth_user LIMIT num;

-- 14. [MEDIUM] Show me each organizations organization along with its related details from other tables.
SELECT t.*, c.*
FROM organizations_organization t
LEFT JOIN organizations_organizationowner c ON c.organization_id = t.id;

-- 15. [MEDIUM] How many organizations organization were added since created=date?
SELECT COUNT(*) FROM organizations_organization
WHERE created >= date('now', '-1 month');

-- 16. [MEDIUM] Break down the organizations organization by name — how many in each?
SELECT name, COUNT(*) as count FROM organizations_organization GROUP BY name;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM organizations_organizationowner
LEFT JOIN organizations_organization ON organizations_organizationowner.organization_id = organizations_organization.id
LEFT JOIN organizations_organizationuser ON organizations_organizationowner.organization_user_id = organizations_organizationuser.id;

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
WHERE id NOT IN (SELECT DISTINCT user_id FROM organizations_organizationuser WHERE user_id IS NOT NULL);

-- 22. [HARD] Combine data from auth_user, organizations_organization, and organizations_organizationowner in a single report.
SELECT * FROM auth_user
LEFT JOIN organizations_organization ON organizations_organization.id = auth_user.user_id
LEFT JOIN organizations_organizationowner ON organizations_organizationowner.id = auth_user.user_id;

-- 23. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM auth_user;

-- 24. [HARD] Pull together a report on organizations organization joining all related tables.
SELECT * FROM organizations_organizationowner
LEFT JOIN organizations_organization ON organizations_organizationowner.organization_id = organizations_organization.id
LEFT JOIN organizations_organizationuser ON organizations_organizationowner.organization_user_id = organizations_organizationuser.id;


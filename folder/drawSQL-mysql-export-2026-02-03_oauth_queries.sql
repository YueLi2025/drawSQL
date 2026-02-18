-- SQLite queries for: drawSQL-mysql-export-2026-02-03_oauth
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many users do we have?
SELECT COUNT(*) FROM auth_user;

-- 3. [EASY] Show me all of our users.
SELECT * FROM auth_user;

-- 4. [EASY] Can you look up a specific user?
SELECT * FROM auth_user WHERE id = ?;

-- 5. [EASY] Find the user with a certain name or email.
SELECT * FROM auth_user WHERE username = ?;

-- 6. [EASY] Which users are currently active or turned on?
SELECT * FROM auth_user LIMIT 10;

-- 7. [EASY] What users were added or changed recently?
SELECT * FROM auth_user ORDER BY date_joined DESC LIMIT 50;

-- 8. [EASY] What are the different password values we have?
SELECT * FROM auth_user LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM auth_user LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN oauth2_provider_accesstoken c ON c.user_id = t.id;

-- 11. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many users in each?
SELECT password, COUNT(*) as count FROM auth_user GROUP BY password;

-- 13. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM oauth2_provider_accesstoken WHERE user_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY client_type ORDER BY id DESC) as rn
  FROM oauth2_provider_application
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each oauth2 provider accesstoken along with its related details.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN oauth2_provider_accesstoken c ON c.user_id = t.id;

-- 16. [MEDIUM] How many oauth2 provider accesstoken did we have last month?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM oauth2_provider_accesstoken
LEFT JOIN oauth2_provider_application ON oauth2_provider_accesstoken.application_id = oauth2_provider_application.id
LEFT JOIN auth_user ON oauth2_provider_accesstoken.user_id = auth_user.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT password, COUNT(*) as cnt FROM auth_user GROUP BY password
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY password ORDER BY id DESC) as rn
  FROM auth_user
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM auth_user LIMIT 10;


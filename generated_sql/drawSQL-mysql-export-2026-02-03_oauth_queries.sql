-- SQLite queries for: drawSQL-mysql-export-2026-02-03_oauth
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM auth_user;

-- 3. [EASY] Show me all of our users.
SELECT * FROM auth_user;

-- 4. [EASY] Can you look up the user with id=num?
SELECT * FROM auth_user WHERE id = num;

-- 5. [EASY] Find the user where username=string.
SELECT * FROM auth_user WHERE username = string;

-- 6. [EASY] How many users were created since date_joined=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 7. [EASY] What are the most recent users ordered by password?
SELECT * FROM auth_user ORDER BY date_joined DESC LIMIT num;

-- 8. [EASY] How many oauth2 provider accesstoken do we have in total?
SELECT COUNT(*) FROM oauth2_provider_accesstoken;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM auth_user t
LEFT JOIN oauth2_provider_accesstoken c ON c.user_id = t.id;

-- 11. [MEDIUM] How many users were added since date_joined=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the users by password — how many in each?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 13. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM oauth2_provider_accesstoken WHERE user_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM auth_user ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', date_joined) as period,
  COUNT(*) as count
FROM auth_user
WHERE date_joined >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT password, COUNT(*) as cnt FROM auth_user GROUP BY password
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM oauth2_provider_accesstoken
LEFT JOIN oauth2_provider_application ON oauth2_provider_accesstoken.application_id = oauth2_provider_application.id
LEFT JOIN auth_user ON oauth2_provider_accesstoken.user_id = auth_user.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY password ORDER BY id DESC) as rn
  FROM auth_user
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', date_joined) as period,
  COUNT(*) as count
FROM auth_user
WHERE date_joined >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT password, COUNT(*) as cnt FROM auth_user GROUP BY password
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on date_joined.
SELECT *, COUNT(*) OVER (ORDER BY date_joined) as running_count
FROM auth_user
ORDER BY date_joined;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM auth_user
WHERE id NOT IN (SELECT DISTINCT user_id FROM oauth2_provider_accesstoken WHERE user_id IS NOT NULL);

-- 23. [HARD] Combine data from auth_user, oauth2_provider_accesstoken, and oauth2_provider_application in a single report.
SELECT * FROM auth_user
LEFT JOIN oauth2_provider_accesstoken ON oauth2_provider_accesstoken.id = auth_user.user_id
LEFT JOIN oauth2_provider_application ON oauth2_provider_application.id = auth_user.application_id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM auth_user;


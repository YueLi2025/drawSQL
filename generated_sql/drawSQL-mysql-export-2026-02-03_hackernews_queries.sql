-- SQLite queries for: drawSQL-mysql-export-2026-02-03_hackernews
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT * FROM accounts_customuser LIMIT num;

-- 3. [EASY] How many users do we have in total?
SELECT COUNT(*) FROM accounts_customuser;

-- 4. [EASY] Show me all of our users.
SELECT * FROM accounts_customuser;

-- 5. [EASY] Can you look up the user with id=num?
SELECT * FROM accounts_customuser WHERE id = num;

-- 6. [EASY] Find the user where username=string.
SELECT * FROM accounts_customuser WHERE username = string;

-- 7. [EASY] How many users were created since date_joined=date?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 8. [EASY] What are the most recent users ordered by password?
SELECT * FROM accounts_customuser ORDER BY date_joined DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM accounts_customuser LIMIT num;

-- 10. [MEDIUM] Show me each user along with its related details from other tables.
SELECT t.*, c.*
FROM accounts_customuser t
LEFT JOIN accounts_emailverification c ON c.user_id = t.id;

-- 11. [MEDIUM] How many users were added since date_joined=date?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the users by password — how many in each?
SELECT password, COUNT(*) as count FROM accounts_customuser GROUP BY password;

-- 13. [MEDIUM] Are there any users that don't have a match in related tables?
SELECT * FROM accounts_customuser
WHERE id NOT IN (SELECT DISTINCT user_id FROM accounts_emailverification WHERE user_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 users?
SELECT * FROM accounts_customuser ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of users change month over month?
SELECT
  strftime('%Y-%m', date_joined) as period,
  COUNT(*) as count
FROM accounts_customuser
WHERE date_joined >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which users have duplicate or repeated values?
WITH grouped AS (
  SELECT password, COUNT(*) as cnt FROM accounts_customuser GROUP BY password
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on users joining all related tables.
SELECT * FROM accounts_customuser
LEFT JOIN emaildigest_anonymoussubscription ON accounts_customuser.id = emaildigest_anonymoussubscription.subscription_ptr_id
LEFT JOIN accounts_invitation ON accounts_customuser.used_invitation_id = accounts_invitation.id;

-- 18. [HARD] Who or what is the best in each group of users?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY last_login ORDER BY id DESC) as rn
  FROM accounts_customuser
) WHERE rn = num;

-- 19. [HARD] Which users are above average compared to others in their group?
SELECT
  strftime('%Y-%m', date_joined) as period,
  COUNT(*) as count
FROM accounts_customuser
WHERE date_joined >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group users, filter, then rank the results.
WITH grouped AS (
  SELECT last_login, COUNT(*) as cnt FROM accounts_customuser GROUP BY last_login
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of users over time based on date_joined.
SELECT *, COUNT(*) OVER (ORDER BY date_joined) as running_count
FROM accounts_customuser
ORDER BY date_joined;

-- 22. [HARD] Find users that exist in one table but not in a related table.
SELECT * FROM accounts_customuser
WHERE id NOT IN (SELECT DISTINCT user_id FROM accounts_emailverification WHERE user_id IS NOT NULL);

-- 23. [HARD] Combine data from accounts_customuser, accounts_customuser_groups, and accounts_customuser_user_permissions in a single report.
SELECT * FROM accounts_customuser
LEFT JOIN accounts_customuser_groups ON accounts_customuser_groups.id = accounts_customuser.user_id
LEFT JOIN accounts_customuser_user_permissions ON accounts_customuser_user_permissions.id = accounts_customuser.user_id;

-- 24. [HARD] Rank all users within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM accounts_customuser;


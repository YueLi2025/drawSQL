-- SQLite queries for: drawSQL-mysql-export-2026-02-03_hackernews
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM accounts_customuser LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM accounts_customuser LIMIT 10;

-- 4. [EASY] How many users do we have?
SELECT COUNT(*) FROM accounts_customuser;

-- 5. [EASY] Show me all of our users.
SELECT * FROM accounts_customuser;

-- 6. [EASY] Can you look up a specific user?
SELECT * FROM accounts_customuser WHERE id = ?;

-- 7. [EASY] Find the user with a certain name or email.
SELECT * FROM accounts_customuser WHERE username = ?;

-- 8. [EASY] Which users are currently active or turned on?
SELECT * FROM accounts_customuser LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM accounts_customuser LIMIT 10;

-- 10. [MEDIUM] Show me each user along with its related details.
SELECT t.*, c.*
FROM accounts_customuser t
LEFT JOIN accounts_emailverification c ON c.user_id = t.id;

-- 11. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many users in each?
SELECT password, COUNT(*) as count FROM accounts_customuser GROUP BY password;

-- 13. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM accounts_customuser
WHERE id NOT IN (SELECT DISTINCT user_id FROM accounts_emailverification WHERE user_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY group_id ORDER BY id DESC) as rn
  FROM accounts_customuser_groups
) WHERE rn <= 3;

-- 15. [MEDIUM] How many accounts emailverification did we have last month?
SELECT COUNT(*) FROM accounts_customuser
WHERE date_joined >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many accounts emailverification in each?
SELECT password, COUNT(*) as count FROM accounts_customuser GROUP BY password;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM accounts_customuser
LEFT JOIN emaildigest_anonymoussubscription ON accounts_customuser.id = emaildigest_anonymoussubscription.subscription_ptr_id
LEFT JOIN accounts_invitation ON accounts_customuser.used_invitation_id = accounts_invitation.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT last_login, COUNT(*) as cnt FROM accounts_customuser GROUP BY last_login
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY last_login ORDER BY id DESC) as rn
  FROM accounts_customuser
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM accounts_customuser LIMIT 10;


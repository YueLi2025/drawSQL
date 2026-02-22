-- SQLite queries for: drawSQL-mysql-export-2026-02-09_gravity
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM user
WHERE date_created >= date('now', '-1 month');

-- 2. [EASY] How many account do we have in total?
SELECT COUNT(*) FROM account;

-- 3. [EASY] Show me all of our account.
SELECT * FROM account;

-- 4. [EASY] Can you look up the account with id=num?
SELECT * FROM account WHERE id = num;

-- 5. [EASY] Find the account where email=string.
SELECT * FROM account WHERE email = string;

-- 6. [EASY] Which account have active=num?
SELECT * FROM account WHERE active = num;

-- 7. [EASY] How many account were created since date_created=date?
SELECT COUNT(*) FROM account
WHERE date_created >= date('now', '-1 month');

-- 8. [EASY] What are the most recent account ordered by email?
SELECT * FROM account ORDER BY date_created DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM user LIMIT num;

-- 10. [MEDIUM] Show me each account along with its related details from other tables.
SELECT t.*, c.*
FROM account t
LEFT JOIN invite c ON c.account_id = t.id;

-- 11. [MEDIUM] How many account were added since date_created=date?
SELECT COUNT(*) FROM account
WHERE date_created >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the account by email — how many in each?
SELECT email, COUNT(*) as count FROM account GROUP BY email;

-- 13. [MEDIUM] Are there any account that don't have a match in related tables?
SELECT * FROM account
WHERE id NOT IN (SELECT DISTINCT account_id FROM invite WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 account?
SELECT * FROM account ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of account change month over month?
SELECT
  strftime('%Y-%m', date_created) as period,
  COUNT(*) as count
FROM account
WHERE date_created >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which account have duplicate or repeated values?
SELECT * FROM account WHERE active = num;

-- 17. [HARD] Pull together a report on account joining all related tables.
SELECT * FROM invite
LEFT JOIN account ON invite.account_id = account.id;

-- 18. [HARD] Who or what is the best in each group of account?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id DESC) as rn
  FROM account
) WHERE rn = num;

-- 19. [HARD] Which account are above average compared to others in their group?
SELECT
  strftime('%Y-%m', date_created) as period,
  COUNT(*) as count
FROM account
WHERE date_created >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group account, filter, then rank the results.
WITH grouped AS (
  SELECT email, COUNT(*) as cnt FROM account GROUP BY email
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of account over time based on date_created.
SELECT *, COUNT(*) OVER (ORDER BY date_created) as running_count
FROM account
ORDER BY date_created;

-- 22. [HARD] Find account that exist in one table but not in a related table.
SELECT * FROM account
WHERE id NOT IN (SELECT DISTINCT account_id FROM invite WHERE account_id IS NOT NULL);

-- 23. [HARD] Combine data from account, invite, and user in a single report.
SELECT * FROM account
LEFT JOIN invite ON invite.id = account.account_id
LEFT JOIN user ON user.id = account.account_id;

-- 24. [HARD] Rank all account within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM account;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_gravity
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM account
WHERE date_created >= date('now', '-1 month');

-- 2. [EASY] How many account do we have?
SELECT COUNT(*) FROM account;

-- 3. [EASY] Show me all of our account.
SELECT * FROM account;

-- 4. [EASY] Can you look up a specific account?
SELECT * FROM account WHERE id = ?;

-- 5. [EASY] Find the account with a certain name or email.
SELECT * FROM account WHERE email = ?;

-- 6. [EASY] Which account are currently active or turned on?
SELECT * FROM account WHERE active = 1;

-- 7. [EASY] What account were added or changed recently?
SELECT * FROM account ORDER BY date_created DESC LIMIT 50;

-- 8. [EASY] What are the different email values we have?
SELECT * FROM account LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM account LIMIT 10;

-- 10. [MEDIUM] Show me each account along with its related details.
SELECT t.*, c.*
FROM account t
LEFT JOIN invite c ON c.account_id = t.id;

-- 11. [MEDIUM] How many account did we have last month?
SELECT COUNT(*) FROM account
WHERE date_created >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many account in each?
SELECT email, COUNT(*) as count FROM account GROUP BY email;

-- 13. [MEDIUM] Are there any account that don't have a match somewhere else?
SELECT * FROM account
WHERE id NOT IN (SELECT DISTINCT account_id FROM invite WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM account LIMIT 10;

-- 15. [MEDIUM] How many invitations did we have last month?
SELECT COUNT(*) FROM account
WHERE date_created >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many invitations in each?
SELECT email, COUNT(*) as count FROM account GROUP BY email;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM invite
LEFT JOIN account ON invite.account_id = account.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT email, COUNT(*) as cnt FROM account GROUP BY email
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id DESC) as rn
  FROM account
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM account LIMIT 10;


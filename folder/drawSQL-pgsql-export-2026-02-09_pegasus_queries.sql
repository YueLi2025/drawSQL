-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_pegasus
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM account_emailconfirmation
WHERE created >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT team_id, COUNT(*) as member_count FROM teams_membership GROUP BY team_id;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM teams_invitation WHERE is_accepted = 0;

-- 4. [EASY] How many account emailaddress do we have?
SELECT COUNT(*) FROM account_emailaddress;

-- 5. [EASY] Show me all of our account emailaddress.
SELECT * FROM account_emailaddress;

-- 6. [EASY] Can you look up a specific account emailaddres?
SELECT * FROM account_emailaddress WHERE id = ?;

-- 7. [EASY] Find the account emailaddres with a certain name or email.
SELECT * FROM account_emailaddress WHERE email = ?;

-- 8. [EASY] What are the different email values we have?
SELECT * FROM account_emailaddress LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM account_emailaddress LIMIT 10;

-- 10. [MEDIUM] Show me each account emailaddres along with its related details.
SELECT t.*, c.*
FROM account_emailaddress t
LEFT JOIN account_emailconfirmation c ON c.email_address_id = t.id;

-- 11. [MEDIUM] Break it down by type or category—how many account emailaddress in each?
SELECT email, COUNT(*) as count FROM account_emailaddress GROUP BY email;

-- 12. [MEDIUM] Are there any account emailaddress that don't have a match somewhere else?
SELECT * FROM account_emailaddress
WHERE id NOT IN (SELECT DISTINCT email_address_id FROM account_emailconfirmation WHERE email_address_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM account_emailaddress LIMIT 10;

-- 14. [MEDIUM] Break it down by type or category—how many account emailconfirmation in each?
SELECT email, COUNT(*) as count FROM account_emailaddress GROUP BY email;

-- 15. [MEDIUM] Are there any account emailconfirmation that don't have a match somewhere else?
SELECT * FROM account_emailaddress
WHERE id NOT IN (SELECT DISTINCT email_address_id FROM account_emailconfirmation WHERE email_address_id IS NOT NULL);

-- 16. [MEDIUM] Show me each auth group along with its related details.
SELECT t.*, c.*
FROM account_emailaddress t
LEFT JOIN account_emailconfirmation c ON c.email_address_id = t.id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM account_emailaddress
LEFT JOIN users_customuser ON account_emailaddress.user_id = users_customuser.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT email, COUNT(*) as cnt FROM account_emailaddress GROUP BY email
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id DESC) as rn
  FROM account_emailaddress
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM djstripe_plan t1
WHERE amount > (
  SELECT AVG(amount) FROM djstripe_plan t2 WHERE t2.usage_type = t1.usage_type
);


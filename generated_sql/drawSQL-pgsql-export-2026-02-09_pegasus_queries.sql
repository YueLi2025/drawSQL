-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_pegasus
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM account_emailconfirmation
WHERE created >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT team_id, COUNT(*) as member_count FROM teams_invitation GROUP BY team_id;

-- 3. [EASY] How many account emailaddress do we have in total?
SELECT COUNT(*) FROM account_emailaddress;

-- 4. [EASY] Show me all of our account emailaddress.
SELECT * FROM account_emailaddress;

-- 5. [EASY] Can you look up the account emailaddres with id=num?
SELECT * FROM account_emailaddress WHERE id = num;

-- 6. [EASY] Find the account emailaddres where email=string.
SELECT * FROM account_emailaddress WHERE email = string;

-- 7. [EASY] What are the most recent account emailaddress ordered by email?
SELECT * FROM account_emailaddress ORDER BY email DESC LIMIT num;

-- 8. [EASY] How many account emailconfirmation do we have in total?
SELECT COUNT(*) FROM account_emailconfirmation;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM account_emailaddress LIMIT num;

-- 10. [MEDIUM] Show me each account emailaddres along with its related details from other tables.
SELECT t.*, c.*
FROM account_emailaddress t
LEFT JOIN account_emailconfirmation c ON c.email_address_id = t.id;

-- 11. [MEDIUM] Break down the account emailaddress by email — how many in each?
SELECT email, COUNT(*) as count FROM account_emailaddress GROUP BY email;

-- 12. [MEDIUM] Are there any account emailaddress that don't have a match in related tables?
SELECT * FROM account_emailaddress
WHERE id NOT IN (SELECT DISTINCT email_address_id FROM account_emailconfirmation WHERE email_address_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 account emailaddress?
SELECT * FROM account_emailaddress ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] Which account emailaddress have duplicate or repeated values?
WITH grouped AS (
  SELECT email, COUNT(*) as cnt FROM account_emailaddress GROUP BY email
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 15. [MEDIUM] How many account emailconfirmation were added since created=date?
SELECT COUNT(*) FROM account_emailconfirmation
WHERE created >= date('now', '-1 month');

-- 16. [MEDIUM] Break down the account emailconfirmation by created — how many in each?
SELECT created, COUNT(*) as count FROM account_emailconfirmation GROUP BY created;

-- 17. [HARD] Pull together a report on account emailaddress joining all related tables.
SELECT * FROM account_emailaddress
LEFT JOIN users_customuser ON account_emailaddress.user_id = users_customuser.id;

-- 18. [HARD] Who or what is the best in each group of account emailaddress?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id DESC) as rn
  FROM account_emailaddress
) WHERE rn = num;

-- 19. [HARD] Which account emailaddress are above average compared to others in their group?
SELECT * FROM djstripe_plan t1
WHERE amount > (
  SELECT AVG(amount) FROM djstripe_plan t2 WHERE t2.usage_type = t1.usage_type
);

-- 20. [HARD] Do a multi-step analysis: group account emailaddress, filter, then rank the results.
WITH grouped AS (
  SELECT email, COUNT(*) as cnt FROM account_emailaddress GROUP BY email
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find account emailaddress that exist in one table but not in a related table.
SELECT * FROM account_emailaddress WHERE email = string;

-- 22. [HARD] Combine data from account_emailaddress, account_emailconfirmation, and auth_group in a single report.
SELECT * FROM account_emailaddress
LEFT JOIN account_emailconfirmation ON account_emailconfirmation.id = account_emailaddress.email_address_id
LEFT JOIN auth_group ON auth_group.id = account_emailaddress.group_id;

-- 23. [HARD] Rank all account emailaddress within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM account_emailaddress;

-- 24. [HARD] Pull together a report on account emailconfirmation joining all related tables.
SELECT * FROM account_emailaddress
LEFT JOIN users_customuser ON account_emailaddress.user_id = users_customuser.id;


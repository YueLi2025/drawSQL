-- SQLite queries for: drawSQL-mysql-export-2026-02-02_monica
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM accounts LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM accounts LIMIT 10;

-- 4. [EASY] How many accounts do we have?
SELECT COUNT(*) FROM accounts;

-- 5. [EASY] Show me all of our accounts.
SELECT * FROM accounts;

-- 6. [EASY] Can you look up a specific account?
SELECT * FROM accounts WHERE id = ?;

-- 7. [EASY] What accounts were added or changed recently?
SELECT * FROM accounts ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different has access to paid version for free values we have?
SELECT * FROM accounts LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each account along with its related details.
SELECT t.*, c.*
FROM accounts t
LEFT JOIN activities c ON c.account_id = t.id;

-- 11. [MEDIUM] How many accounts did we have last month?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many accounts in each?
SELECT has_access_to_paid_version_for_free, COUNT(*) as count FROM accounts GROUP BY has_access_to_paid_version_for_free;

-- 13. [MEDIUM] Are there any accounts that don't have a match somewhere else?
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM activities WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY activity_type_id ORDER BY id DESC) as rn
  FROM activities
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each activity along with its related details.
SELECT t.*, c.*
FROM accounts t
LEFT JOIN activities c ON c.account_id = t.id;

-- 16. [MEDIUM] How many activities did we have last month?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM activities
LEFT JOIN accounts ON activities.account_id = accounts.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT has_access_to_paid_version_for_free, COUNT(*) as cnt FROM accounts GROUP BY has_access_to_paid_version_for_free
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY has_access_to_paid_version_for_free ORDER BY id DESC) as rn
  FROM accounts
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM debts
WHERE amount > (SELECT AVG(amount) FROM debts);


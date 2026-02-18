-- SQLite queries for: drawSQL-mysql-export-2026-02-02_akaunting
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many accounts do we have?
SELECT COUNT(*) FROM accounts;

-- 3. [EASY] Show me all of our accounts.
SELECT * FROM accounts;

-- 4. [EASY] Can you look up a specific account?
SELECT * FROM accounts WHERE id = ?;

-- 5. [EASY] Find the account with a certain name or email.
SELECT * FROM accounts WHERE name = ?;

-- 6. [EASY] Which accounts are currently active or turned on?
SELECT * FROM accounts WHERE enabled = 1;

-- 7. [EASY] What accounts were added or changed recently?
SELECT * FROM accounts ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different company id values we have?
SELECT * FROM accounts LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each account along with its related details.
SELECT t.*, c.*
FROM accounts t
LEFT JOIN reconciliations c ON c.account_id = t.id;

-- 11. [MEDIUM] How many accounts did we have last month?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many accounts in each?
SELECT company_id, COUNT(*) as count FROM accounts GROUP BY company_id;

-- 13. [MEDIUM] Are there any accounts that don't have a match somewhere else?
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM reconciliations WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM categories
) WHERE rn <= 3;

-- 15. [MEDIUM] How many bill histories did we have last month?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many bill histories in each?
SELECT company_id, COUNT(*) as count FROM accounts GROUP BY company_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM accounts
LEFT JOIN companies ON accounts.company_id = companies.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT company_id, COUNT(*) as cnt FROM accounts GROUP BY company_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY company_id ORDER BY id DESC) as rn
  FROM accounts
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM items t1
WHERE quantity > (
  SELECT AVG(quantity) FROM items t2 WHERE t2.category_id = t1.category_id
);


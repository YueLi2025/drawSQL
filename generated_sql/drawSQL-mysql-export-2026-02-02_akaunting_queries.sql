-- SQLite queries for: drawSQL-mysql-export-2026-02-02_akaunting
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many accounts do we have in total?
SELECT COUNT(*) FROM accounts;

-- 3. [EASY] Show me all of our accounts.
SELECT * FROM accounts;

-- 4. [EASY] Can you look up the account with id=num?
SELECT * FROM accounts WHERE id = num;

-- 5. [EASY] Find the account where name=string.
SELECT * FROM accounts WHERE name = string;

-- 6. [EASY] Which accounts have enabled=num?
SELECT * FROM accounts WHERE enabled = num;

-- 7. [EASY] How many accounts were created since created_at=date?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent accounts ordered by company_id?
SELECT * FROM accounts ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each account along with its related details from other tables.
SELECT t.*, c.*
FROM accounts t
LEFT JOIN reconciliations c ON c.account_id = t.id;

-- 11. [MEDIUM] How many accounts were added since created_at=date?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the accounts by company_id — how many in each?
SELECT company_id, COUNT(*) as count FROM accounts GROUP BY company_id;

-- 13. [MEDIUM] Are there any accounts that don't have a match in related tables?
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM reconciliations WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 accounts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM categories
) WHERE rn <= num;

-- 15. [MEDIUM] How did the number of accounts change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM accounts
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which accounts have duplicate or repeated values?
SELECT * FROM accounts WHERE enabled = num;

-- 17. [HARD] Pull together a report on accounts joining all related tables.
SELECT * FROM accounts
LEFT JOIN companies ON accounts.company_id = companies.id;

-- 18. [HARD] Who or what is the best in each group of accounts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY company_id ORDER BY id DESC) as rn
  FROM accounts
) WHERE rn = num;

-- 19. [HARD] Which accounts are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM accounts
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group accounts, filter, then rank the results.
WITH grouped AS (
  SELECT company_id, COUNT(*) as cnt FROM accounts GROUP BY company_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of accounts over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM accounts
ORDER BY created_at;

-- 22. [HARD] Find accounts that exist in one table but not in a related table.
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM reconciliations WHERE account_id IS NOT NULL);

-- 23. [HARD] Combine data from accounts, bill_histories, and bill_item_taxes in a single report.
SELECT * FROM accounts
LEFT JOIN bill_histories ON bill_histories.id = accounts.account_id
LEFT JOIN bill_item_taxes ON bill_item_taxes.id = accounts.account_id
LEFT JOIN taxes ON taxes.id = accounts.tax_id;

-- 24. [HARD] Rank all accounts within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM accounts;


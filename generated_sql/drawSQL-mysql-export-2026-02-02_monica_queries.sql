-- SQLite queries for: drawSQL-mysql-export-2026-02-02_monica
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT * FROM accounts LIMIT num;

-- 3. [EASY] How many accounts do we have in total?
SELECT COUNT(*) FROM accounts;

-- 4. [EASY] Show me all of our accounts.
SELECT * FROM accounts;

-- 5. [EASY] Can you look up the account with id=num?
SELECT * FROM accounts WHERE id = num;

-- 6. [EASY] How many accounts were created since created_at=date?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent accounts ordered by has_access_to_paid_version_for_free?
SELECT * FROM accounts ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many activities do we have in total?
SELECT COUNT(*) FROM activities;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each account along with its related details from other tables.
SELECT t.*, c.*
FROM accounts t
LEFT JOIN activities c ON c.account_id = t.id;

-- 11. [MEDIUM] How many accounts were added since created_at=date?
SELECT COUNT(*) FROM accounts
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the accounts by has_access_to_paid_version_for_free — how many in each?
SELECT has_access_to_paid_version_for_free, COUNT(*) as count FROM accounts GROUP BY has_access_to_paid_version_for_free;

-- 13. [MEDIUM] Are there any accounts that don't have a match in related tables?
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM activities WHERE account_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 accounts?
SELECT * FROM accounts ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of accounts change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM accounts
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which accounts have duplicate or repeated values?
WITH grouped AS (
  SELECT has_access_to_paid_version_for_free, COUNT(*) as cnt FROM accounts GROUP BY has_access_to_paid_version_for_free
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 17. [HARD] Pull together a report on accounts joining all related tables.
SELECT * FROM activities
LEFT JOIN accounts ON activities.account_id = accounts.id;

-- 18. [HARD] Who or what is the best in each group of accounts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY has_access_to_paid_version_for_free ORDER BY id DESC) as rn
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
  SELECT has_access_to_paid_version_for_free, COUNT(*) as cnt FROM accounts GROUP BY has_access_to_paid_version_for_free
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of accounts over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM accounts
ORDER BY created_at;

-- 22. [HARD] Find accounts that exist in one table but not in a related table.
SELECT * FROM accounts
WHERE id NOT IN (SELECT DISTINCT account_id FROM activities WHERE account_id IS NOT NULL);

-- 23. [HARD] Combine data from accounts, activities, and activity_contact in a single report.
SELECT * FROM accounts
LEFT JOIN activities ON activities.id = accounts.account_id
LEFT JOIN activity_contact ON activity_contact.id = accounts.account_id;

-- 24. [HARD] Rank all accounts within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM accounts;


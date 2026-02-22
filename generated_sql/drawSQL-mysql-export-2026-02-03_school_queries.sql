-- SQLite queries for: drawSQL-mysql-export-2026-02-03_school
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms have price between num and num?
SELECT * FROM accounts WHERE amount BETWEEN num AND num ORDER BY amount;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 3. [EASY] How many account sectors do we have in total?
SELECT COUNT(*) FROM account_sectors;

-- 4. [EASY] Show me all of our account sectors.
SELECT * FROM account_sectors;

-- 5. [EASY] Can you look up the account sector with id=num?
SELECT * FROM account_sectors WHERE id = num;

-- 6. [EASY] Find the account sector where name=string.
SELECT * FROM account_sectors WHERE name = string;

-- 7. [EASY] How many account sectors were created since created_at=date?
SELECT COUNT(*) FROM account_sectors
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent account sectors ordered by name?
SELECT * FROM account_sectors ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account sectors were added since created_at=date?
SELECT COUNT(*) FROM account_sectors
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the account sectors by type — how many in each?
SELECT type, COUNT(*) as count FROM account_sectors GROUP BY type;

-- 12. [MEDIUM] Are there any account sectors that don't have a match in related tables?
SELECT * FROM account_sectors LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 account sectors?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM account_sectors
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of account sectors change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_sectors
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which account sectors have duplicate or repeated values?
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM account_sectors GROUP BY type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] What's our total and average amount across all accounts?
SELECT SUM(amount) as total, AVG(amount) as average FROM accounts;

-- 17. [HARD] Pull together a report on account sectors joining all related tables.
SELECT * FROM account_sectors
LEFT JOIN users ON account_sectors.user_id = users.id
LEFT JOIN schools ON account_sectors.school_id = schools.id;

-- 18. [HARD] Who or what is the best in each group of account sectors?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM account_sectors
) WHERE rn = num;

-- 19. [HARD] Which account sectors are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_sectors
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group account sectors, filter, then rank the results.
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM account_sectors GROUP BY type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of account sectors over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM account_sectors
ORDER BY created_at;

-- 22. [HARD] Find account sectors that exist in one table but not in a related table.
SELECT * FROM account_sectors LIMIT num;

-- 23. [HARD] Combine data from account_sectors, accounts, and attendances in a single report.
SELECT * FROM account_sectors
LEFT JOIN accounts ON accounts.id = account_sectors.id
LEFT JOIN attendances ON attendances.id = account_sectors.id;

-- 24. [HARD] Rank all account sectors within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM account_sectors
) WHERE rn <= num;


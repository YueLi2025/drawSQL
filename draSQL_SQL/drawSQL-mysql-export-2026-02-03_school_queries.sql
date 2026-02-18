-- SQLite queries for: drawSQL-mysql-export-2026-02-03_school
-- Generated from natural language questions
============================================================

-- 1. [EASY] What rooms are available in a certain price range?
SELECT * FROM account_sectors LIMIT 10;

-- 2. [EASY] Which rooms have the most bedrooms or bathrooms?
SELECT * FROM account_sectors LIMIT 10;

-- 3. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 4. [EASY] How many account sectors do we have?
SELECT COUNT(*) FROM account_sectors;

-- 5. [EASY] Show me all of our account sectors.
SELECT * FROM account_sectors;

-- 6. [EASY] Can you look up a specific account sector?
SELECT * FROM account_sectors WHERE id = ?;

-- 7. [EASY] Find the account sector with a certain name or email.
SELECT * FROM account_sectors WHERE name = ?;

-- 8. [EASY] What account sectors were added or changed recently?
SELECT * FROM account_sectors ORDER BY created_at DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account sectors did we have last month?
SELECT COUNT(*) FROM account_sectors
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many account sectors in each?
SELECT type, COUNT(*) as count FROM account_sectors GROUP BY type;

-- 12. [MEDIUM] Are there any account sectors that don't have a match somewhere else?
SELECT * FROM account_sectors LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM account_sectors
) WHERE rn <= 3;

-- 14. [MEDIUM] What's our total or average amount across all accounts?
SELECT SUM(amount) as total, AVG(amount) as average FROM accounts;

-- 15. [MEDIUM] How many accounts did we have last month?
SELECT COUNT(*) FROM account_sectors
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many accounts in each?
SELECT type, COUNT(*) as count FROM account_sectors GROUP BY type;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM account_sectors
LEFT JOIN users ON account_sectors.user_id = users.id
LEFT JOIN schools ON account_sectors.school_id = schools.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT type, COUNT(*) as cnt FROM account_sectors GROUP BY type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY amount DESC) as rn
  FROM accounts
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM accounts t1
WHERE amount > (
  SELECT AVG(amount) FROM accounts t2 WHERE t2.type = t1.type
);


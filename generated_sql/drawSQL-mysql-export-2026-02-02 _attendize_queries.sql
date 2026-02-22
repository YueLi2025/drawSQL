-- SQLite queries for: drawSQL-mysql-export-2026-02-02 _attendize
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many account payment gateways do we have in total?
SELECT COUNT(*) FROM account_payment_gateways;

-- 3. [EASY] Show me all of our account payment gateways.
SELECT * FROM account_payment_gateways;

-- 4. [EASY] Can you look up the account payment gateway with id=num?
SELECT * FROM account_payment_gateways WHERE id = num;

-- 5. [EASY] How many account payment gateways were created since created_at=date?
SELECT COUNT(*) FROM account_payment_gateways
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent account payment gateways ordered by account_id?
SELECT * FROM account_payment_gateways ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many accounts do we have in total?
SELECT COUNT(*) FROM accounts;

-- 8. [EASY] Show me all of our accounts.
SELECT * FROM accounts;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account payment gateways were added since created_at=date?
SELECT COUNT(*) FROM account_payment_gateways
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the account payment gateways by account_id — how many in each?
SELECT account_id, COUNT(*) as count FROM account_payment_gateways GROUP BY account_id;

-- 12. [MEDIUM] Are there any account payment gateways that don't have a match in related tables?
SELECT * FROM account_payment_gateways LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 account payment gateways?
SELECT * FROM account_payment_gateways ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of account payment gateways change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_payment_gateways
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which account payment gateways have duplicate or repeated values?
WITH grouped AS (
  SELECT account_id, COUNT(*) as cnt FROM account_payment_gateways GROUP BY account_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each account along with its related details from other tables.
SELECT * FROM account_payment_gateways;

-- 17. [HARD] Pull together a report on account payment gateways joining all related tables.
SELECT * FROM account_payment_gateways
LEFT JOIN accounts ON account_payment_gateways.account_id = accounts.id;

-- 18. [HARD] Who or what is the best in each group of account payment gateways?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY id DESC) as rn
  FROM account_payment_gateways
) WHERE rn = num;

-- 19. [HARD] Which account payment gateways are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM account_payment_gateways
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group account payment gateways, filter, then rank the results.
WITH grouped AS (
  SELECT account_id, COUNT(*) as cnt FROM account_payment_gateways GROUP BY account_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of account payment gateways over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM account_payment_gateways
ORDER BY created_at;

-- 22. [HARD] Find account payment gateways that exist in one table but not in a related table.
SELECT * FROM account_payment_gateways LIMIT num;

-- 23. [HARD] Combine data from account_payment_gateways, accounts, and affiliates in a single report.
SELECT * FROM account_payment_gateways
LEFT JOIN accounts ON accounts.id = account_payment_gateways.account_id
LEFT JOIN affiliates ON affiliates.id = account_payment_gateways.id
LEFT JOIN payment_gateways ON payment_gateways.id = account_payment_gateways.payment_gateway_id;

-- 24. [HARD] Rank all account payment gateways within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM account_payment_gateways;


-- SQLite queries for: drawSQL-mysql-export-2026-02-02 _attendize
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many account payment gateways do we have?
SELECT COUNT(*) FROM account_payment_gateways;

-- 3. [EASY] Show me all of our account payment gateways.
SELECT * FROM account_payment_gateways;

-- 4. [EASY] Can you look up a specific account payment gateway?
SELECT * FROM account_payment_gateways WHERE id = ?;

-- 5. [EASY] What account payment gateways were added or changed recently?
SELECT * FROM account_payment_gateways ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different account id values we have?
SELECT * FROM account_payment_gateways LIMIT 10;

-- 7. [EASY] How many accounts do we have?
SELECT COUNT(*) FROM account_payment_gateways;

-- 8. [EASY] Show me all of our accounts.
SELECT * FROM account_payment_gateways;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account payment gateways did we have last month?
SELECT COUNT(*) FROM account_payment_gateways
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many account payment gateways in each?
SELECT account_id, COUNT(*) as count FROM account_payment_gateways GROUP BY account_id;

-- 12. [MEDIUM] Are there any account payment gateways that don't have a match somewhere else?
SELECT * FROM account_payment_gateways LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM account_payment_gateways LIMIT 10;

-- 14. [MEDIUM] Show me each account along with its related details.
SELECT * FROM account_payment_gateways;

-- 15. [MEDIUM] How many accounts did we have last month?
SELECT COUNT(*) FROM account_payment_gateways
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many accounts in each?
SELECT account_id, COUNT(*) as count FROM account_payment_gateways GROUP BY account_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM account_payment_gateways
LEFT JOIN accounts ON account_payment_gateways.account_id = accounts.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT account_id, COUNT(*) as cnt FROM account_payment_gateways GROUP BY account_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY id DESC) as rn
  FROM account_payment_gateways
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM order_items
WHERE quantity > (SELECT AVG(quantity) FROM order_items);


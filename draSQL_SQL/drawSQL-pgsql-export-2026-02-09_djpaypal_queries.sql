-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_djpaypal
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have an active subscription?
SELECT * FROM djpaypal_billingagreement LIMIT 10;

-- 2. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 3. [EASY] How many djpaypal billingagreement do we have?
SELECT COUNT(*) FROM djpaypal_billingagreement;

-- 4. [EASY] Show me all of our djpaypal billingagreement.
SELECT * FROM djpaypal_billingagreement;

-- 5. [EASY] Can you look up a specific djpaypal billingagreement?
SELECT * FROM djpaypal_billingagreement WHERE id = ?;

-- 6. [EASY] Find the djpaypal billingagreement with a certain name or email.
SELECT * FROM djpaypal_billingagreement WHERE name = ?;

-- 7. [EASY] What djpaypal billingagreement were added or changed recently?
SELECT * FROM djpaypal_billingagreement ORDER BY start_date DESC LIMIT 50;

-- 8. [EASY] What are the different name values we have?
SELECT * FROM djpaypal_billingagreement LIMIT 10;

-- 9. [MEDIUM] How much money did we make this month?
SELECT * FROM djpaypal_billingagreement LIMIT 10;

-- 10. [MEDIUM] Who are our most active users?
SELECT * FROM djpaypal_billingagreement LIMIT 10;

-- 11. [MEDIUM] Show me each djpaypal billingagreement along with its related details.
SELECT t.*, c.*
FROM djpaypal_billingagreement t
LEFT JOIN djpaypal_preparedbillingagreement c ON c.executed_agreement_id = t.id;

-- 12. [MEDIUM] How many djpaypal billingagreement did we have last month?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 13. [MEDIUM] Break it down by type or category—how many djpaypal billingagreement in each?
SELECT name, COUNT(*) as count FROM djpaypal_billingagreement GROUP BY name;

-- 14. [MEDIUM] Are there any djpaypal billingagreement that don't have a match somewhere else?
SELECT * FROM djpaypal_billingagreement
WHERE id NOT IN (SELECT DISTINCT executed_agreement_id FROM djpaypal_preparedbillingagreement WHERE executed_agreement_id IS NOT NULL);

-- 15. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id DESC) as rn
  FROM djpaypal_billingplan
) WHERE rn <= 3;

-- 16. [MEDIUM] How many djpaypal billingplan did we have last month?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM djpaypal_billingagreement
LEFT JOIN djpaypal_sale ON djpaypal_billingagreement.id = djpaypal_sale.billing_agreement_id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM djpaypal_billingagreement GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM djpaypal_billingagreement
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM djpaypal_chargemodel t1
WHERE amount > (
  SELECT AVG(amount) FROM djpaypal_chargemodel t2 WHERE t2.type = t1.type
);


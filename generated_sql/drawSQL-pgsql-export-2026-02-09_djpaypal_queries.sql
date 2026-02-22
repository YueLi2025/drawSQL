-- SQLite queries for: drawSQL-pgsql-export-2026-02-09_djpaypal
-- Generated from natural language questions
============================================================

-- 1. [EASY] Which customers have status=string for their subscription?
SELECT * FROM djpaypal_billingagreement;

-- 2. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 3. [EASY] How many djpaypal billingagreement do we have in total?
SELECT COUNT(*) FROM djpaypal_billingagreement;

-- 4. [EASY] Show me all of our djpaypal billingagreement.
SELECT * FROM djpaypal_billingagreement;

-- 5. [EASY] Can you look up the djpaypal billingagreement with id=num?
SELECT * FROM djpaypal_billingagreement WHERE id = num;

-- 6. [EASY] Find the djpaypal billingagreement where name=string.
SELECT * FROM djpaypal_billingagreement WHERE name = string;

-- 7. [EASY] How many djpaypal billingagreement were created since start_date=date?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 8. [EASY] What are the most recent djpaypal billingagreement ordered by name?
SELECT * FROM djpaypal_billingagreement ORDER BY start_date DESC LIMIT num;

-- 9. [MEDIUM] How much revenue since created_at=date?
SELECT * FROM djpaypal_billingagreement LIMIT num;

-- 10. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM djpaypal_billingagreement LIMIT num;

-- 11. [MEDIUM] Show me each djpaypal billingagreement along with its related details from other tables.
SELECT t.*, c.*
FROM djpaypal_billingagreement t
LEFT JOIN djpaypal_preparedbillingagreement c ON c.executed_agreement_id = t.id;

-- 12. [MEDIUM] How many djpaypal billingagreement were added since start_date=date?
SELECT COUNT(*) FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-1 month');

-- 13. [MEDIUM] Break down the djpaypal billingagreement by name — how many in each?
SELECT name, COUNT(*) as count FROM djpaypal_billingagreement GROUP BY name;

-- 14. [MEDIUM] Are there any djpaypal billingagreement that don't have a match in related tables?
SELECT * FROM djpaypal_billingagreement
WHERE id NOT IN (SELECT DISTINCT executed_agreement_id FROM djpaypal_preparedbillingagreement WHERE executed_agreement_id IS NOT NULL);

-- 15. [MEDIUM] For each group, what are the top 3 djpaypal billingagreement?
SELECT * FROM djpaypal_billingagreement ORDER BY id DESC LIMIT num;

-- 16. [MEDIUM] How did the number of djpaypal billingagreement change month over month?
SELECT
  strftime('%Y-%m', start_date) as period,
  COUNT(*) as count
FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 17. [HARD] Pull together a report on djpaypal billingagreement joining all related tables.
SELECT * FROM djpaypal_billingagreement
LEFT JOIN djpaypal_sale ON djpaypal_billingagreement.id = djpaypal_sale.billing_agreement_id;

-- 18. [HARD] Who or what is the best in each group of djpaypal billingagreement?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM djpaypal_billingagreement
) WHERE rn = num;

-- 19. [HARD] Which djpaypal billingagreement are above average compared to others in their group?
SELECT
  strftime('%Y-%m', start_date) as period,
  COUNT(*) as count
FROM djpaypal_billingagreement
WHERE start_date >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group djpaypal billingagreement, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM djpaypal_billingagreement GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of djpaypal billingagreement over time based on start_date.
SELECT *, COUNT(*) OVER (ORDER BY start_date) as running_count
FROM djpaypal_billingagreement
ORDER BY start_date;

-- 22. [HARD] Find djpaypal billingagreement that exist in one table but not in a related table.
SELECT * FROM djpaypal_billingagreement
WHERE id NOT IN (SELECT DISTINCT executed_agreement_id FROM djpaypal_preparedbillingagreement WHERE executed_agreement_id IS NOT NULL);

-- 23. [HARD] Combine data from djpaypal_billingagreement, djpaypal_billingplan, and djpaypal_billingplan_payment_definitions in a single report.
SELECT * FROM djpaypal_billingagreement
LEFT JOIN djpaypal_billingplan ON djpaypal_billingplan.id = djpaypal_billingagreement.executed_agreement_id
LEFT JOIN djpaypal_billingplan_payment_definitions ON djpaypal_billingplan_payment_definitions.billingplan_id = djpaypal_billingagreement.id;

-- 24. [HARD] Rank all djpaypal billingagreement within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM djpaypal_billingagreement;


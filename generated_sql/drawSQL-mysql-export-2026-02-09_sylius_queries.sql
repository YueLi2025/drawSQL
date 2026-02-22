-- SQLite queries for: drawSQL-mysql-export-2026-02-09_sylius
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many messenger messages do we have in total?
SELECT COUNT(*) FROM messenger_messages;

-- 3. [EASY] Show me all of our messenger messages.
SELECT * FROM messenger_messages;

-- 4. [EASY] Can you look up the messenger message with id=num?
SELECT * FROM messenger_messages WHERE id = num;

-- 5. [EASY] Find the messenger message where queue_name=string.
SELECT * FROM messenger_messages WHERE queue_name = string;

-- 6. [EASY] How many messenger messages were created since created_at=date?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent messenger messages ordered by body?
SELECT * FROM messenger_messages ORDER BY created_at DESC LIMIT num;

-- 8. [EASY] How many sylius address do we have in total?
SELECT COUNT(*) FROM sylius_address;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM messenger_messages LIMIT num;

-- 10. [MEDIUM] How many messenger messages were added since created_at=date?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the messenger messages by body — how many in each?
SELECT body, COUNT(*) as count FROM messenger_messages GROUP BY body;

-- 12. [MEDIUM] Are there any messenger messages that don't have a match in related tables?
SELECT * FROM messenger_messages LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 messenger messages?
SELECT * FROM messenger_messages ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of messenger messages change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM messenger_messages
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which messenger messages have duplicate or repeated values?
WITH grouped AS (
  SELECT body, COUNT(*) as cnt FROM messenger_messages GROUP BY body
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each sylius addres along with its related details from other tables.
SELECT * FROM messenger_messages;

-- 17. [HARD] Pull together a report on messenger messages joining all related tables.
SELECT * FROM messenger_messages
LEFT JOIN sylius_catalog_promotion_channels ON messenger_messages.id = sylius_catalog_promotion_channels.catalog_promotion_id
LEFT JOIN sylius_product_image_product_variants ON messenger_messages.id = sylius_product_image_product_variants.image_id;

-- 18. [HARD] Who or what is the best in each group of messenger messages?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY body ORDER BY id DESC) as rn
  FROM messenger_messages
) WHERE rn = num;

-- 19. [HARD] Which messenger messages are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM messenger_messages
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group messenger messages, filter, then rank the results.
WITH grouped AS (
  SELECT body, COUNT(*) as cnt FROM messenger_messages GROUP BY body
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of messenger messages over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM messenger_messages
ORDER BY created_at;

-- 22. [HARD] Find messenger messages that exist in one table but not in a related table.
SELECT * FROM messenger_messages LIMIT num;

-- 23. [HARD] Combine data from messenger_messages, sylius_address, and sylius_address_log_entries in a single report.
SELECT * FROM messenger_messages
LEFT JOIN sylius_address ON sylius_address.id = messenger_messages.billing_address_id
LEFT JOIN sylius_address_log_entries ON sylius_address_log_entries.id = messenger_messages.id;

-- 24. [HARD] Rank all messenger messages within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM messenger_messages;


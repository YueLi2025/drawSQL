-- SQLite queries for: drawSQL-mysql-export-2026-02-09_sylius
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many messenger messages do we have?
SELECT COUNT(*) FROM messenger_messages;

-- 3. [EASY] Show me all of our messenger messages.
SELECT * FROM messenger_messages;

-- 4. [EASY] Can you look up a specific messenger message?
SELECT * FROM messenger_messages WHERE id = ?;

-- 5. [EASY] Find the messenger message with a certain name or email.
SELECT * FROM messenger_messages WHERE queue_name = ?;

-- 6. [EASY] What messenger messages were added or changed recently?
SELECT * FROM messenger_messages ORDER BY created_at DESC LIMIT 50;

-- 7. [EASY] What are the different body values we have?
SELECT * FROM messenger_messages LIMIT 10;

-- 8. [EASY] How many sylius address do we have?
SELECT COUNT(*) FROM messenger_messages;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM messenger_messages LIMIT 10;

-- 10. [MEDIUM] How many messenger messages did we have last month?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many messenger messages in each?
SELECT body, COUNT(*) as count FROM messenger_messages GROUP BY body;

-- 12. [MEDIUM] Are there any messenger messages that don't have a match somewhere else?
SELECT * FROM messenger_messages LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM messenger_messages LIMIT 10;

-- 14. [MEDIUM] Show me each sylius addres along with its related details.
SELECT * FROM messenger_messages;

-- 15. [MEDIUM] How many sylius address did we have last month?
SELECT COUNT(*) FROM messenger_messages
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many sylius address in each?
SELECT body, COUNT(*) as count FROM messenger_messages GROUP BY body;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM messenger_messages
LEFT JOIN sylius_catalog_promotion_channels ON messenger_messages.id = sylius_catalog_promotion_channels.catalog_promotion_id
LEFT JOIN sylius_product_image_product_variants ON messenger_messages.id = sylius_product_image_product_variants.image_id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT body, COUNT(*) as cnt FROM messenger_messages GROUP BY body
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY body ORDER BY id DESC) as rn
  FROM messenger_messages
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM sylius_product_option_value_translation
WHERE value > (SELECT AVG(value) FROM sylius_product_option_value_translation);


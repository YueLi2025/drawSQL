-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laraveltalk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many messages do we have?
SELECT COUNT(*) FROM messages;

-- 3. [EASY] Show me all of our messages.
SELECT * FROM messages;

-- 4. [EASY] Can you look up a specific message?
SELECT * FROM messages WHERE id = ?;

-- 5. [EASY] What messages were added or changed recently?
SELECT * FROM messages ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different message values we have?
SELECT * FROM messages LIMIT 10;

-- 7. [EASY] How many conversations do we have?
SELECT COUNT(*) FROM messages;

-- 8. [EASY] Show me all of our conversations.
SELECT * FROM messages;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many messages did we have last month?
SELECT COUNT(*) FROM messages
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many messages in each?
SELECT message, COUNT(*) as count FROM messages GROUP BY message;

-- 12. [MEDIUM] Are there any messages that don't have a match somewhere else?
SELECT * FROM messages LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM messages LIMIT 10;

-- 14. [MEDIUM] Show me each conversation along with its related details.
SELECT * FROM messages;

-- 15. [MEDIUM] How many conversations did we have last month?
SELECT COUNT(*) FROM messages
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break it down by type or category—how many conversations in each?
SELECT message, COUNT(*) as count FROM messages GROUP BY message;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM conversations
LEFT JOIN users ON conversations.user_two = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT message, COUNT(*) as cnt FROM messages GROUP BY message
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY message ORDER BY id DESC) as rn
  FROM messages
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM messages LIMIT 10;


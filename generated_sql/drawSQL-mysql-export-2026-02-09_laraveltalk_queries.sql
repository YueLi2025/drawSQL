-- SQLite queries for: drawSQL-mysql-export-2026-02-09_laraveltalk
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many messages do we have in total?
SELECT COUNT(*) FROM messages;

-- 3. [EASY] Show me all of our messages.
SELECT * FROM messages;

-- 4. [EASY] Can you look up the message with id=num?
SELECT * FROM messages WHERE id = num;

-- 5. [EASY] How many messages were created since created_at=date?
SELECT COUNT(*) FROM messages
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent messages ordered by message?
SELECT * FROM messages ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many conversations do we have in total?
SELECT COUNT(*) FROM conversations;

-- 8. [EASY] Show me all of our conversations.
SELECT * FROM conversations;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many messages were added since created_at=date?
SELECT COUNT(*) FROM messages
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the messages by message — how many in each?
SELECT message, COUNT(*) as count FROM messages GROUP BY message;

-- 12. [MEDIUM] Are there any messages that don't have a match in related tables?
SELECT * FROM messages LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 messages?
SELECT * FROM messages ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of messages change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM messages
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which messages have duplicate or repeated values?
WITH grouped AS (
  SELECT message, COUNT(*) as cnt FROM messages GROUP BY message
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each conversation along with its related details from other tables.
SELECT * FROM messages;

-- 17. [HARD] Pull together a report on messages joining all related tables.
SELECT * FROM conversations
LEFT JOIN users ON conversations.user_two = users.id;

-- 18. [HARD] Who or what is the best in each group of messages?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY message ORDER BY id DESC) as rn
  FROM messages
) WHERE rn = num;

-- 19. [HARD] Which messages are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM messages
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group messages, filter, then rank the results.
WITH grouped AS (
  SELECT message, COUNT(*) as cnt FROM messages GROUP BY message
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of messages over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM messages
ORDER BY created_at;

-- 22. [HARD] Find messages that exist in one table but not in a related table.
SELECT * FROM messages LIMIT num;

-- 23. [HARD] Combine data from messages, conversations, and users in a single report.
SELECT * FROM messages
LEFT JOIN conversations ON conversations.id = messages.conversation_id
LEFT JOIN users ON users.id = messages.user_two;

-- 24. [HARD] Rank all messages within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM messages;


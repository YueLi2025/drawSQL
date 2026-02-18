-- SQLite queries for: drawSQL-mysql-export-2026-02-09_diaspora
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM account_deletions LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM account_deletions LIMIT 10;

-- 4. [EASY] How many account deletions do we have?
SELECT COUNT(*) FROM account_deletions;

-- 5. [EASY] Show me all of our account deletions.
SELECT * FROM account_deletions;

-- 6. [EASY] Can you look up a specific account deletion?
SELECT * FROM account_deletions WHERE id = ?;

-- 7. [EASY] What are the different person id values we have?
SELECT * FROM account_deletions LIMIT 10;

-- 8. [EASY] How many team members do we have?
SELECT COUNT(*) FROM account_deletions;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Break it down by type or category—how many account deletions in each?
SELECT person_id, COUNT(*) as count FROM account_deletions GROUP BY person_id;

-- 11. [MEDIUM] Are there any account deletions that don't have a match somewhere else?
SELECT * FROM account_deletions LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM account_deletions LIMIT 10;

-- 13. [MEDIUM] How many team members did we have last month?
SELECT COUNT(*) FROM account_deletions
WHERE completed_at >= date('now', '-1 month');

-- 14. [MEDIUM] Break it down by type or category—how many team members in each?
SELECT person_id, COUNT(*) as count FROM account_deletions GROUP BY person_id;

-- 15. [MEDIUM] Are there any team members that don't have a match somewhere else?
SELECT * FROM account_deletions LIMIT 10;

-- 16. [MEDIUM] Break it down by type or category—how many aspect visibilities in each?
SELECT person_id, COUNT(*) as count FROM account_deletions GROUP BY person_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM aspects;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT person_id, COUNT(*) as cnt FROM account_deletions GROUP BY person_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY id DESC) as rn
  FROM account_deletions
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM simple_captcha_data
WHERE value > (SELECT AVG(value) FROM simple_captcha_data);


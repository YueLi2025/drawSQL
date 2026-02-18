-- SQLite queries for: drawSQL-mysql-export-2026-02-09_bouncer
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many abilities do we have?
SELECT COUNT(*) FROM abilities;

-- 2. [EASY] Show me all of our abilities.
SELECT * FROM abilities;

-- 3. [EASY] Can you look up a specific ability?
SELECT * FROM abilities WHERE id = ?;

-- 4. [EASY] Find the ability with a certain name or email.
SELECT * FROM abilities WHERE name = ?;

-- 5. [EASY] What abilities were added or changed recently?
SELECT * FROM abilities ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different name values we have?
SELECT * FROM abilities LIMIT 10;

-- 7. [EASY] How many assigned roles do we have?
SELECT COUNT(*) FROM abilities;

-- 8. [EASY] Show me all of our assigned roles.
SELECT * FROM abilities;

-- 9. [MEDIUM] Show me each ability along with its related details.
SELECT t.*, c.*
FROM abilities t
LEFT JOIN permissions c ON c.ability_id = t.id;

-- 10. [MEDIUM] How many abilities did we have last month?
SELECT COUNT(*) FROM abilities
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many abilities in each?
SELECT entity_type, COUNT(*) as count FROM abilities GROUP BY entity_type;

-- 12. [MEDIUM] Are there any abilities that don't have a match somewhere else?
SELECT * FROM abilities
WHERE id NOT IN (SELECT DISTINCT ability_id FROM permissions WHERE ability_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM abilities
) WHERE rn <= 3;

-- 14. [MEDIUM] Break it down by type or category—how many assigned roles in each?
SELECT entity_type, COUNT(*) as count FROM abilities GROUP BY entity_type;

-- 15. [MEDIUM] Are there any assigned roles that don't have a match somewhere else?
SELECT * FROM abilities
WHERE id NOT IN (SELECT DISTINCT ability_id FROM permissions WHERE ability_id IS NOT NULL);

-- 16. [MEDIUM] Break it down by type or category—how many permissions in each?
SELECT entity_type, COUNT(*) as count FROM abilities GROUP BY entity_type;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM permissions
LEFT JOIN abilities ON permissions.ability_id = abilities.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM abilities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM abilities
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM abilities LIMIT 10;


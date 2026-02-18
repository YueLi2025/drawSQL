-- SQLite queries for: drawSQL-mysql-export-2026-02-02_robots
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many robots rule do we have?
SELECT COUNT(*) FROM robots_rule;

-- 2. [EASY] Show me all of our robots rule.
SELECT * FROM robots_rule;

-- 3. [EASY] Can you look up a specific robots rule?
SELECT * FROM robots_rule WHERE id = ?;

-- 4. [EASY] What are the different robot values we have?
SELECT * FROM robots_rule LIMIT 10;

-- 5. [EASY] How many robots rule allowed do we have?
SELECT COUNT(*) FROM robots_rule;

-- 6. [EASY] Show me all of our robots rule allowed.
SELECT * FROM robots_rule;

-- 7. [EASY] Can you look up a specific robots rule allowed?
SELECT * FROM robots_rule WHERE id = ?;

-- 8. [EASY] What are the different rule id values we have?
SELECT * FROM robots_rule LIMIT 10;

-- 9. [MEDIUM] Show me each robots rule along with its related details.
SELECT t.*, c.*
FROM robots_rule t
LEFT JOIN robots_rule_allowed c ON c.rule_id = t.id;

-- 10. [MEDIUM] Break it down by type or category—how many robots rule in each?
SELECT robot, COUNT(*) as count FROM robots_rule GROUP BY robot;

-- 11. [MEDIUM] Are there any robots rule that don't have a match somewhere else?
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM robots_rule LIMIT 10;

-- 13. [MEDIUM] Break it down by type or category—how many robots rule allowed in each?
SELECT robot, COUNT(*) as count FROM robots_rule GROUP BY robot;

-- 14. [MEDIUM] Are there any robots rule allowed that don't have a match somewhere else?
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 15. [MEDIUM] Break it down by type or category—how many robots rule disallowed in each?
SELECT robot, COUNT(*) as count FROM robots_rule GROUP BY robot;

-- 16. [MEDIUM] Are there any robots rule disallowed that don't have a match somewhere else?
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM robots_rule_allowed
LEFT JOIN robots_url ON robots_rule_allowed.url_id = robots_url.id
LEFT JOIN robots_rule ON robots_rule_allowed.rule_id = robots_rule.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT robot, COUNT(*) as cnt FROM robots_rule GROUP BY robot
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY robot ORDER BY id DESC) as rn
  FROM robots_rule
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM robots_rule LIMIT 10;


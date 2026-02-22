-- SQLite queries for: drawSQL-mysql-export-2026-02-02_robots
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many robots rule do we have in total?
SELECT COUNT(*) FROM robots_rule;

-- 2. [EASY] Show me all of our robots rule.
SELECT * FROM robots_rule;

-- 3. [EASY] Can you look up the robots rule with id=num?
SELECT * FROM robots_rule WHERE id = num;

-- 4. [EASY] What are the most recent robots rule ordered by robot?
SELECT * FROM robots_rule ORDER BY robot DESC LIMIT num;

-- 5. [EASY] How many robots rule allowed do we have in total?
SELECT COUNT(*) FROM robots_rule;

-- 6. [EASY] Show me all of our robots rule allowed.
SELECT * FROM robots_rule;

-- 7. [EASY] Can you look up the robots rule allowed with id=num?
SELECT * FROM robots_rule WHERE id = num;

-- 8. [EASY] What are the most recent robots rule allowed ordered by rule_id?
SELECT * FROM robots_rule ORDER BY robot DESC LIMIT num;

-- 9. [MEDIUM] Show me each robots rule along with its related details from other tables.
SELECT t.*, c.*
FROM robots_rule t
LEFT JOIN robots_rule_allowed c ON c.rule_id = t.id;

-- 10. [MEDIUM] Break down the robots rule by robot — how many in each?
SELECT robot, COUNT(*) as count FROM robots_rule GROUP BY robot;

-- 11. [MEDIUM] Are there any robots rule that don't have a match in related tables?
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 12. [MEDIUM] For each group, what are the top 3 robots rule?
SELECT * FROM robots_rule ORDER BY id DESC LIMIT num;

-- 13. [MEDIUM] Which robots rule have duplicate or repeated values?
WITH grouped AS (
  SELECT robot, COUNT(*) as cnt FROM robots_rule GROUP BY robot
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 14. [MEDIUM] Break down the robots rule allowed by rule_id — how many in each?
SELECT robot, COUNT(*) as count FROM robots_rule GROUP BY robot;

-- 15. [MEDIUM] Are there any robots rule allowed that don't have a match in related tables?
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 16. [MEDIUM] For each group, what are the top 3 robots rule allowed?
SELECT * FROM robots_rule ORDER BY id DESC LIMIT num;

-- 17. [HARD] Pull together a report on robots rule joining all related tables.
SELECT * FROM robots_rule_allowed
LEFT JOIN robots_url ON robots_rule_allowed.url_id = robots_url.id
LEFT JOIN robots_rule ON robots_rule_allowed.rule_id = robots_rule.id;

-- 18. [HARD] Who or what is the best in each group of robots rule?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY robot ORDER BY id DESC) as rn
  FROM robots_rule
) WHERE rn = num;

-- 19. [HARD] Which robots rule are above average compared to others in their group?
SELECT * FROM robots_rule LIMIT num;

-- 20. [HARD] Do a multi-step analysis: group robots rule, filter, then rank the results.
WITH grouped AS (
  SELECT robot, COUNT(*) as cnt FROM robots_rule GROUP BY robot
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Find robots rule that exist in one table but not in a related table.
SELECT * FROM robots_rule
WHERE id NOT IN (SELECT DISTINCT rule_id FROM robots_rule_allowed WHERE rule_id IS NOT NULL);

-- 22. [HARD] Combine data from robots_rule, robots_rule_allowed, and robots_rule_disallowed in a single report.
SELECT * FROM robots_rule
LEFT JOIN robots_rule_allowed ON robots_rule_allowed.id = robots_rule.rule_id
LEFT JOIN robots_rule_disallowed ON robots_rule_disallowed.id = robots_rule.rule_id;

-- 23. [HARD] Rank all robots rule within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM robots_rule;

-- 24. [HARD] Pull together a report on robots rule allowed joining all related tables.
SELECT * FROM robots_rule_allowed
LEFT JOIN robots_url ON robots_rule_allowed.url_id = robots_url.id
LEFT JOIN robots_rule ON robots_rule_allowed.rule_id = robots_rule.id;


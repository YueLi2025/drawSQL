-- SQLite queries for: drawSQL-mysql-export-2026-02-09_bouncer
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many abilities do we have in total?
SELECT COUNT(*) FROM abilities;

-- 2. [EASY] Show me all of our abilities.
SELECT * FROM abilities;

-- 3. [EASY] Can you look up the ability with id=num?
SELECT * FROM abilities WHERE id = num;

-- 4. [EASY] Find the ability where name=string.
SELECT * FROM abilities WHERE name = string;

-- 5. [EASY] How many abilities were created since created_at=date?
SELECT COUNT(*) FROM abilities
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent abilities ordered by name?
SELECT * FROM abilities ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many assigned roles do we have in total?
SELECT COUNT(*) FROM assigned_roles;

-- 8. [EASY] Show me all of our assigned roles.
SELECT * FROM assigned_roles;

-- 9. [MEDIUM] Show me each ability along with its related details from other tables.
SELECT t.*, c.*
FROM abilities t
LEFT JOIN permissions c ON c.ability_id = t.id;

-- 10. [MEDIUM] How many abilities were added since created_at=date?
SELECT COUNT(*) FROM abilities
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the abilities by entity_type — how many in each?
SELECT entity_type, COUNT(*) as count FROM abilities GROUP BY entity_type;

-- 12. [MEDIUM] Are there any abilities that don't have a match in related tables?
SELECT * FROM abilities
WHERE id NOT IN (SELECT DISTINCT ability_id FROM permissions WHERE ability_id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 abilities?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM abilities
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of abilities change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM abilities
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which abilities have duplicate or repeated values?
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM abilities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Break down the assigned roles by entity_type — how many in each?
SELECT entity_type, COUNT(*) as count FROM assigned_roles GROUP BY entity_type;

-- 17. [HARD] Pull together a report on abilities joining all related tables.
SELECT * FROM permissions
LEFT JOIN abilities ON permissions.ability_id = abilities.id;

-- 18. [HARD] Who or what is the best in each group of abilities?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM abilities
) WHERE rn = num;

-- 19. [HARD] Which abilities are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM abilities
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group abilities, filter, then rank the results.
WITH grouped AS (
  SELECT entity_type, COUNT(*) as cnt FROM abilities GROUP BY entity_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of abilities over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM abilities
ORDER BY created_at;

-- 22. [HARD] Find abilities that exist in one table but not in a related table.
SELECT * FROM abilities
WHERE id NOT IN (SELECT DISTINCT ability_id FROM permissions WHERE ability_id IS NOT NULL);

-- 23. [HARD] Combine data from abilities, assigned_roles, and permissions in a single report.
SELECT * FROM abilities
LEFT JOIN assigned_roles ON assigned_roles.id = abilities.ability_id
LEFT JOIN permissions ON permissions.id = abilities.ability_id
LEFT JOIN roles ON roles.id = abilities.ability_id;

-- 24. [HARD] Rank all abilities within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY entity_type ORDER BY id DESC) as rn
  FROM abilities
) WHERE rn <= num;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_love
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many love reactant reaction counters do we have in total?
SELECT COUNT(*) FROM love_reactant_reaction_counters;

-- 2. [EASY] Show me all of our love reactant reaction counters.
SELECT * FROM love_reactant_reaction_counters;

-- 3. [EASY] Can you look up the love reactant reaction counter with id=num?
SELECT * FROM love_reactant_reaction_counters WHERE id = num;

-- 4. [EASY] How many love reactant reaction counters were created since created_at=date?
SELECT COUNT(*) FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-1 month');

-- 5. [EASY] What are the most recent love reactant reaction counters ordered by reactant_id?
SELECT * FROM love_reactant_reaction_counters ORDER BY created_at DESC LIMIT num;

-- 6. [EASY] How many love reactant reaction totals do we have in total?
SELECT COUNT(*) FROM love_reactant_reaction_totals;

-- 7. [EASY] Show me all of our love reactant reaction totals.
SELECT * FROM love_reactant_reaction_totals;

-- 8. [EASY] Can you look up the love reactant reaction total with id=num?
SELECT * FROM love_reactant_reaction_counters WHERE id = num;

-- 9. [MEDIUM] How many love reactant reaction counters were added since created_at=date?
SELECT COUNT(*) FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-1 month');

-- 10. [MEDIUM] Break down the love reactant reaction counters by reaction_type_id — how many in each?
SELECT reaction_type_id, COUNT(*) as count FROM love_reactant_reaction_counters GROUP BY reaction_type_id;

-- 11. [MEDIUM] Are there any love reactant reaction counters that don't have a match in related tables?
SELECT * FROM love_reactant_reaction_counters LIMIT num;

-- 12. [MEDIUM] For each group, what are the top 3 love reactant reaction counters?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY reaction_type_id ORDER BY id DESC) as rn
  FROM love_reactant_reaction_counters
) WHERE rn <= num;

-- 13. [MEDIUM] How did the number of love reactant reaction counters change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 14. [MEDIUM] Which love reactant reaction counters have duplicate or repeated values?
WITH grouped AS (
  SELECT reaction_type_id, COUNT(*) as cnt FROM love_reactant_reaction_counters GROUP BY reaction_type_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 15. [MEDIUM] How many love reactant reaction totals were added since created_at=date?
SELECT COUNT(*) FROM love_reactant_reaction_totals
WHERE created_at >= date('now', '-1 month');

-- 16. [MEDIUM] Break down the love reactant reaction totals by reactant_id — how many in each?
SELECT reactant_id, COUNT(*) as count FROM love_reactant_reaction_totals GROUP BY reactant_id;

-- 17. [HARD] Pull together a report on love reactant reaction counters joining all related tables.
SELECT * FROM love_reactant_reaction_counters
LEFT JOIN love_reaction_types ON love_reactant_reaction_counters.reaction_type_id = love_reaction_types.id
LEFT JOIN love_reactants ON love_reactant_reaction_counters.reactant_id = love_reactants.id;

-- 18. [HARD] Who or what is the best in each group of love reactant reaction counters?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY reaction_type_id ORDER BY id DESC) as rn
  FROM love_reactant_reaction_counters
) WHERE rn = num;

-- 19. [HARD] Which love reactant reaction counters are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group love reactant reaction counters, filter, then rank the results.
WITH grouped AS (
  SELECT reaction_type_id, COUNT(*) as cnt FROM love_reactant_reaction_counters GROUP BY reaction_type_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of love reactant reaction counters over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM love_reactant_reaction_counters
ORDER BY created_at;

-- 22. [HARD] Find love reactant reaction counters that exist in one table but not in a related table.
SELECT * FROM love_reactant_reaction_counters LIMIT num;

-- 23. [HARD] Combine data from love_reactant_reaction_counters, love_reactant_reaction_totals, and love_reactants in a single report.
SELECT * FROM love_reactant_reaction_counters
LEFT JOIN love_reactant_reaction_totals ON love_reactant_reaction_totals.id = love_reactant_reaction_counters.id
LEFT JOIN love_reactants ON love_reactants.id = love_reactant_reaction_counters.reactant_id;

-- 24. [HARD] Rank all love reactant reaction counters within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY reaction_type_id ORDER BY id DESC) as rn
  FROM love_reactant_reaction_counters
) WHERE rn <= num;


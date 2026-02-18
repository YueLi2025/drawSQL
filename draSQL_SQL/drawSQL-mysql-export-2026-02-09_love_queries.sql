-- SQLite queries for: drawSQL-mysql-export-2026-02-09_love
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many love reactant reaction counters do we have?
SELECT COUNT(*) FROM love_reactant_reaction_counters;

-- 2. [EASY] Show me all of our love reactant reaction counters.
SELECT * FROM love_reactant_reaction_counters;

-- 3. [EASY] Can you look up a specific love reactant reaction counter?
SELECT * FROM love_reactant_reaction_counters WHERE id = ?;

-- 4. [EASY] What love reactant reaction counters were added or changed recently?
SELECT * FROM love_reactant_reaction_counters ORDER BY created_at DESC LIMIT 50;

-- 5. [EASY] What are the different reactant id values we have?
SELECT * FROM love_reactant_reaction_counters LIMIT 10;

-- 6. [EASY] How many love reactant reaction totals do we have?
SELECT COUNT(*) FROM love_reactant_reaction_counters;

-- 7. [EASY] Show me all of our love reactant reaction totals.
SELECT * FROM love_reactant_reaction_counters;

-- 8. [EASY] Can you look up a specific love reactant reaction total?
SELECT * FROM love_reactant_reaction_counters WHERE id = ?;

-- 9. [MEDIUM] How many love reactant reaction counters did we have last month?
SELECT COUNT(*) FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-1 month');

-- 10. [MEDIUM] Break it down by type or category—how many love reactant reaction counters in each?
SELECT reaction_type_id, COUNT(*) as count FROM love_reactant_reaction_counters GROUP BY reaction_type_id;

-- 11. [MEDIUM] Are there any love reactant reaction counters that don't have a match somewhere else?
SELECT * FROM love_reactant_reaction_counters LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY reaction_type_id ORDER BY id DESC) as rn
  FROM love_reactant_reaction_counters
) WHERE rn <= 3;

-- 13. [MEDIUM] How many love reactant reaction totals did we have last month?
SELECT COUNT(*) FROM love_reactant_reaction_counters
WHERE created_at >= date('now', '-1 month');

-- 14. [MEDIUM] Break it down by type or category—how many love reactant reaction totals in each?
SELECT reaction_type_id, COUNT(*) as count FROM love_reactant_reaction_counters GROUP BY reaction_type_id;

-- 15. [MEDIUM] Are there any love reactant reaction totals that don't have a match somewhere else?
SELECT * FROM love_reactant_reaction_counters LIMIT 10;

-- 16. [MEDIUM] Show me each love reactant along with its related details.
SELECT * FROM love_reactant_reaction_counters;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM love_reactant_reaction_counters
LEFT JOIN love_reaction_types ON love_reactant_reaction_counters.reaction_type_id = love_reaction_types.id
LEFT JOIN love_reactants ON love_reactant_reaction_counters.reactant_id = love_reactants.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT reaction_type_id, COUNT(*) as cnt FROM love_reactant_reaction_counters GROUP BY reaction_type_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY reaction_type_id ORDER BY id DESC) as rn
  FROM love_reactant_reaction_counters
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM love_reactant_reaction_counters LIMIT 10;


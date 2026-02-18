-- SQLite queries for: drawSQL-mysql-export-2026-02-09_flipper
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many flipper features do we have?
SELECT COUNT(*) FROM flipper_features;

-- 2. [EASY] Show me all of our flipper features.
SELECT * FROM flipper_features;

-- 3. [EASY] Can you look up a specific flipper feature?
SELECT * FROM flipper_features WHERE id = ?;

-- 4. [EASY] What flipper features were added or changed recently?
SELECT * FROM flipper_features ORDER BY created_at DESC LIMIT 50;

-- 5. [EASY] How many flipper gates do we have?
SELECT COUNT(*) FROM flipper_features;

-- 6. [EASY] Show me all of our flipper gates.
SELECT * FROM flipper_features;

-- 7. [EASY] Can you look up a specific flipper gate?
SELECT * FROM flipper_features WHERE id = ?;

-- 8. [EASY] What flipper gates were added or changed recently?
SELECT * FROM flipper_features ORDER BY created_at DESC LIMIT 50;

-- 9. [MEDIUM] How many flipper features did we have last month?
SELECT COUNT(*) FROM flipper_features
WHERE created_at >= date('now', '-1 month');

-- 10. [MEDIUM] Break it down by type or category—how many flipper features in each?
SELECT feature_key, COUNT(*) as count FROM flipper_gates GROUP BY feature_key;

-- 11. [MEDIUM] Are there any flipper features that don't have a match somewhere else?
SELECT * FROM flipper_features LIMIT 10;

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM flipper_features LIMIT 10;

-- 13. [MEDIUM] What's our total or average value across all flipper gates?
SELECT SUM(value) as total, AVG(value) as average FROM flipper_gates;

-- 14. [MEDIUM] How many flipper gates did we have last month?
SELECT COUNT(*) FROM flipper_features
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many flipper gates in each?
SELECT feature_key, COUNT(*) as count FROM flipper_gates GROUP BY feature_key;

-- 16. [MEDIUM] Which flipper gate has the highest or lowest value?
SELECT * FROM flipper_gates ORDER BY value DESC LIMIT 1;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM flipper_features;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT created_at, COUNT(*) as cnt FROM flipper_features GROUP BY created_at
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY created_at ORDER BY id DESC) as rn
  FROM flipper_features
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM flipper_gates
WHERE value > (SELECT AVG(value) FROM flipper_gates);


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_flipper
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many flipper features do we have in total?
SELECT COUNT(*) FROM flipper_features;

-- 2. [EASY] Show me all of our flipper features.
SELECT * FROM flipper_features;

-- 3. [EASY] Can you look up the flipper feature with id=num?
SELECT * FROM flipper_features WHERE id = num;

-- 4. [EASY] How many flipper features were created since created_at=date?
SELECT COUNT(*) FROM flipper_features
WHERE created_at >= date('now', '-1 month');

-- 5. [EASY] How many flipper gates do we have in total?
SELECT COUNT(*) FROM flipper_gates;

-- 6. [EASY] Show me all of our flipper gates.
SELECT * FROM flipper_gates;

-- 7. [EASY] Can you look up the flipper gate with id=num?
SELECT * FROM flipper_features WHERE id = num;

-- 8. [EASY] How many flipper gates were created since created_at=date?
SELECT COUNT(*) FROM flipper_gates
WHERE created_at >= date('now', '-1 month');

-- 9. [MEDIUM] How many flipper features were added since created_at=date?
SELECT COUNT(*) FROM flipper_features
WHERE created_at >= date('now', '-1 month');

-- 10. [MEDIUM] Are there any flipper features that don't have a match in related tables?
SELECT * FROM flipper_features LIMIT num;

-- 11. [MEDIUM] For each group, what are the top 3 flipper features?
SELECT * FROM flipper_features ORDER BY id DESC LIMIT num;

-- 12. [MEDIUM] How did the number of flipper features change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM flipper_features
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 13. [MEDIUM] Which flipper features have duplicate or repeated values?
SELECT * FROM flipper_features LIMIT num;

-- 14. [MEDIUM] What's our total and average value across all flipper gates?
SELECT SUM(value) as total, AVG(value) as average FROM flipper_gates;

-- 15. [MEDIUM] Which flipper gate has the highest value?
SELECT * FROM flipper_gates ORDER BY value DESC LIMIT 1;

-- 16. [MEDIUM] How many flipper gates were added since created_at=date?
SELECT COUNT(*) FROM flipper_gates
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on flipper features joining all related tables.
SELECT * FROM flipper_features;

-- 18. [HARD] Who or what is the best in each group of flipper features?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY created_at ORDER BY id DESC) as rn
  FROM flipper_features
) WHERE rn = num;

-- 19. [HARD] Which flipper features are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM flipper_features
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group flipper features, filter, then rank the results.
WITH grouped AS (
  SELECT created_at, COUNT(*) as cnt FROM flipper_features GROUP BY created_at
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of flipper features over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM flipper_features
ORDER BY created_at;

-- 22. [HARD] Find flipper features that exist in one table but not in a related table.
SELECT * FROM flipper_features LIMIT num;

-- 23. [HARD] Rank all flipper features within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM flipper_features;

-- 24. [HARD] Pull together a report on flipper gates joining all related tables.
SELECT * FROM flipper_features;


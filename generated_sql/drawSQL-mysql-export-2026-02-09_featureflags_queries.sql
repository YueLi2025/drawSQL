-- SQLite queries for: drawSQL-mysql-export-2026-02-09_featureflags
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many features do we have in total?
SELECT COUNT(*) FROM features;

-- 3. [EASY] Show me all of our features.
SELECT * FROM features;

-- 4. [EASY] Can you look up the feature with id=num?
SELECT * FROM features WHERE id = num;

-- 5. [EASY] Find the feature where name=string.
SELECT * FROM features WHERE name = string;

-- 6. [EASY] Which features have active=boolean?
SELECT * FROM features WHERE active = boolean;

-- 7. [EASY] How many features were created since created_at=date?
SELECT COUNT(*) FROM features
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent features ordered by name?
SELECT * FROM features ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each feature along with its related details from other tables.
SELECT t.*, c.*
FROM features t
LEFT JOIN feature_feature_groups c ON c.feature_id = t.id;

-- 11. [MEDIUM] How many features were added since created_at=date?
SELECT COUNT(*) FROM features
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break down the features by name — how many in each?
SELECT name, COUNT(*) as count FROM features GROUP BY name;

-- 13. [MEDIUM] Are there any features that don't have a match in related tables?
SELECT * FROM features
WHERE id NOT IN (SELECT DISTINCT feature_id FROM feature_feature_groups WHERE feature_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what are the top 3 features?
SELECT * FROM features ORDER BY id DESC LIMIT num;

-- 15. [MEDIUM] How did the number of features change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM features
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 16. [MEDIUM] Which features have duplicate or repeated values?
SELECT * FROM features WHERE active = num;

-- 17. [HARD] Pull together a report on features joining all related tables.
SELECT * FROM feature_feature_groups
LEFT JOIN feature_groups ON feature_feature_groups.feature_group_id = feature_groups.id
LEFT JOIN features ON feature_feature_groups.feature_id = features.id;

-- 18. [HARD] Who or what is the best in each group of features?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM features
) WHERE rn = num;

-- 19. [HARD] Which features are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM features
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group features, filter, then rank the results.
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM features GROUP BY name
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of features over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM features
ORDER BY created_at;

-- 22. [HARD] Find features that exist in one table but not in a related table.
SELECT * FROM features
WHERE id NOT IN (SELECT DISTINCT feature_id FROM feature_feature_groups WHERE feature_id IS NOT NULL);

-- 23. [HARD] Combine data from features, feature_groups, and feature_feature_groups in a single report.
SELECT * FROM features
LEFT JOIN feature_groups ON feature_groups.id = features.feature_group_id
LEFT JOIN feature_feature_groups ON feature_feature_groups.id = features.feature_id;

-- 24. [HARD] Rank all features within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM features;


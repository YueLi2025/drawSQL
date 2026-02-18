-- SQLite queries for: drawSQL-mysql-export-2026-02-09_featureflags
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many features do we have?
SELECT COUNT(*) FROM features;

-- 3. [EASY] Show me all of our features.
SELECT * FROM features;

-- 4. [EASY] Can you look up a specific feature?
SELECT * FROM features WHERE id = ?;

-- 5. [EASY] Find the feature with a certain name or email.
SELECT * FROM features WHERE name = ?;

-- 6. [EASY] Which features are currently active or turned on?
SELECT * FROM features WHERE active = 1;

-- 7. [EASY] What features were added or changed recently?
SELECT * FROM features ORDER BY created_at DESC LIMIT 50;

-- 8. [EASY] What are the different name values we have?
SELECT * FROM features LIMIT 10;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] Show me each feature along with its related details.
SELECT t.*, c.*
FROM features t
LEFT JOIN feature_feature_groups c ON c.feature_id = t.id;

-- 11. [MEDIUM] How many features did we have last month?
SELECT COUNT(*) FROM features
WHERE created_at >= date('now', '-1 month');

-- 12. [MEDIUM] Break it down by type or category—how many features in each?
SELECT name, COUNT(*) as count FROM features GROUP BY name;

-- 13. [MEDIUM] Are there any features that don't have a match somewhere else?
SELECT * FROM features
WHERE id NOT IN (SELECT DISTINCT feature_id FROM feature_feature_groups WHERE feature_id IS NOT NULL);

-- 14. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY feature_group_id ORDER BY id DESC) as rn
  FROM feature_feature_groups
) WHERE rn <= 3;

-- 15. [MEDIUM] Show me each feature group along with its related details.
SELECT t.*, c.*
FROM features t
LEFT JOIN feature_feature_groups c ON c.feature_id = t.id;

-- 16. [MEDIUM] How many feature groups did we have last month?
SELECT COUNT(*) FROM features
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM feature_feature_groups
LEFT JOIN feature_groups ON feature_feature_groups.feature_group_id = feature_groups.id
LEFT JOIN features ON feature_feature_groups.feature_id = features.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT name, COUNT(*) as cnt FROM features GROUP BY name
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id DESC) as rn
  FROM features
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM features LIMIT 10;


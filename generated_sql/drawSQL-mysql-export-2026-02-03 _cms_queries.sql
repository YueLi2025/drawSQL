-- SQLite queries for: drawSQL-mysql-export-2026-02-03 _cms
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many bootstrap4 alerts bootstrap4alerts do we have in total?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts;

-- 2. [EASY] Show me all of our bootstrap4 alerts bootstrap4alerts.
SELECT * FROM bootstrap4_alerts_bootstrap4alerts;

-- 3. [EASY] Can you look up the bootstrap4 alerts bootstrap4alert with id=num?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts LIMIT num;

-- 4. [EASY] How many bootstrap4 alerts bootstrap4alerts were created since attributes=date?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts
WHERE attributes >= date('now', '-1 month');

-- 5. [EASY] What are the most recent bootstrap4 alerts bootstrap4alerts ordered by cmsplugin_ptr_id?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts ORDER BY attributes DESC LIMIT num;

-- 6. [EASY] How many bootstrap4 badge bootstrap4badge do we have in total?
SELECT COUNT(*) FROM bootstrap4_badge_bootstrap4badge;

-- 7. [EASY] Show me all of our bootstrap4 badge bootstrap4badge.
SELECT * FROM bootstrap4_badge_bootstrap4badge;

-- 8. [EASY] Can you look up the bootstrap4 badge bootstrap4badge with id=num?
SELECT * FROM bootstrap4_badge_bootstrap4badge LIMIT num;

-- 9. [MEDIUM] Show me each bootstrap4 alerts bootstrap4alert along with its related details from other tables.
SELECT t.*, c.*
FROM bootstrap4_alerts_bootstrap4alerts t
LEFT JOIN cms_cmsplugin c ON c.id = t.cmsplugin_ptr_id;

-- 10. [MEDIUM] How many bootstrap4 alerts bootstrap4alerts were added since attributes=date?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts
WHERE attributes >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the bootstrap4 alerts bootstrap4alerts by tag_type — how many in each?
SELECT tag_type, COUNT(*) as count FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type;

-- 12. [MEDIUM] Are there any bootstrap4 alerts bootstrap4alerts that don't have a match in related tables?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts
WHERE id NOT IN (SELECT DISTINCT id FROM cms_cmsplugin WHERE id IS NOT NULL);

-- 13. [MEDIUM] For each group, what are the top 3 bootstrap4 alerts bootstrap4alerts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tag_type ORDER BY id DESC) as rn
  FROM bootstrap4_alerts_bootstrap4alerts
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of bootstrap4 alerts bootstrap4alerts change month over month?
SELECT
  strftime('%Y-%m', attributes) as period,
  COUNT(*) as count
FROM bootstrap4_alerts_bootstrap4alerts
WHERE attributes >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which bootstrap4 alerts bootstrap4alerts have duplicate or repeated values?
WITH grouped AS (
  SELECT tag_type, COUNT(*) as cnt FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each bootstrap4 badge bootstrap4badge along with its related details from other tables.
SELECT t.*, c.*
FROM bootstrap4_badge_bootstrap4badge t
LEFT JOIN cms_cmsplugin c ON c.id = t.cmsplugin_ptr_id;

-- 17. [HARD] Pull together a report on bootstrap4 alerts bootstrap4alerts joining all related tables.
SELECT * FROM cms_cmsplugin
LEFT JOIN bootstrap4_link_bootstrap4link ON cms_cmsplugin.id = bootstrap4_link_bootstrap4link.cmsplugin_ptr_id
LEFT JOIN bootstrap4_tabs_bootstrap4tab ON cms_cmsplugin.id = bootstrap4_tabs_bootstrap4tab.cmsplugin_ptr_id
LEFT JOIN bootstrap4_content_bootstrap4code ON cms_cmsplugin.id = bootstrap4_content_bootstrap4code.cmsplugin_ptr_id;

-- 18. [HARD] Who or what is the best in each group of bootstrap4 alerts bootstrap4alerts?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tag_type ORDER BY id DESC) as rn
  FROM bootstrap4_alerts_bootstrap4alerts
) WHERE rn = num;

-- 19. [HARD] Which bootstrap4 alerts bootstrap4alerts are above average compared to others in their group?
SELECT
  strftime('%Y-%m', attributes) as period,
  COUNT(*) as count
FROM bootstrap4_alerts_bootstrap4alerts
WHERE attributes >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group bootstrap4 alerts bootstrap4alerts, filter, then rank the results.
WITH grouped AS (
  SELECT tag_type, COUNT(*) as cnt FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of bootstrap4 alerts bootstrap4alerts over time based on attributes.
SELECT *, COUNT(*) OVER (ORDER BY attributes) as running_count
FROM bootstrap4_alerts_bootstrap4alerts
ORDER BY attributes;

-- 22. [HARD] Find bootstrap4 alerts bootstrap4alerts that exist in one table but not in a related table.
SELECT * FROM bootstrap4_alerts_bootstrap4alerts
WHERE id NOT IN (SELECT DISTINCT id FROM cms_cmsplugin WHERE id IS NOT NULL);

-- 23. [HARD] Combine data from bootstrap4_alerts_bootstrap4alerts, bootstrap4_badge_bootstrap4badge, and bootstrap4_card_bootstrap4card in a single report.
SELECT * FROM bootstrap4_alerts_bootstrap4alerts
LEFT JOIN bootstrap4_badge_bootstrap4badge ON bootstrap4_badge_bootstrap4badge.cmsplugin_ptr_id = bootstrap4_alerts_bootstrap4alerts.id
LEFT JOIN bootstrap4_card_bootstrap4card ON bootstrap4_card_bootstrap4card.cmsplugin_ptr_id = bootstrap4_alerts_bootstrap4alerts.id;

-- 24. [HARD] Rank all bootstrap4 alerts bootstrap4alerts within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tag_type ORDER BY id DESC) as rn
  FROM bootstrap4_alerts_bootstrap4alerts
) WHERE rn <= num;


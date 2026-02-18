-- SQLite queries for: drawSQL-mysql-export-2026-02-03 _cms
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many bootstrap4 alerts bootstrap4alerts do we have?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts;

-- 2. [EASY] Show me all of our bootstrap4 alerts bootstrap4alerts.
SELECT * FROM bootstrap4_alerts_bootstrap4alerts;

-- 3. [EASY] Can you look up a specific bootstrap4 alerts bootstrap4alert?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts LIMIT 10;

-- 4. [EASY] What are the different cmsplugin ptr id values we have?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts LIMIT 10;

-- 5. [EASY] How many bootstrap4 badge bootstrap4badge do we have?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts;

-- 6. [EASY] Show me all of our bootstrap4 badge bootstrap4badge.
SELECT * FROM bootstrap4_alerts_bootstrap4alerts;

-- 7. [EASY] Can you look up a specific bootstrap4 badge bootstrap4badge?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts LIMIT 10;

-- 8. [EASY] How many bootstrap4 card bootstrap4card do we have?
SELECT COUNT(*) FROM bootstrap4_alerts_bootstrap4alerts;

-- 9. [MEDIUM] Show me each bootstrap4 alerts bootstrap4alert along with its related details.
SELECT t.*, c.*
FROM bootstrap4_alerts_bootstrap4alerts t
LEFT JOIN cms_cmsplugin c ON c.id = t.cmsplugin_ptr_id;

-- 10. [MEDIUM] Break it down by type or category—how many bootstrap4 alerts bootstrap4alerts in each?
SELECT tag_type, COUNT(*) as count FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type;

-- 11. [MEDIUM] Are there any bootstrap4 alerts bootstrap4alerts that don't have a match somewhere else?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts
WHERE id NOT IN (SELECT DISTINCT id FROM cms_cmsplugin WHERE id IS NOT NULL);

-- 12. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tag_type ORDER BY id DESC) as rn
  FROM bootstrap4_alerts_bootstrap4alerts
) WHERE rn <= 3;

-- 13. [MEDIUM] Show me each bootstrap4 badge bootstrap4badge along with its related details.
SELECT t.*, c.*
FROM bootstrap4_alerts_bootstrap4alerts t
LEFT JOIN cms_cmsplugin c ON c.id = t.cmsplugin_ptr_id;

-- 14. [MEDIUM] Break it down by type or category—how many bootstrap4 badge bootstrap4badge in each?
SELECT tag_type, COUNT(*) as count FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type;

-- 15. [MEDIUM] Are there any bootstrap4 badge bootstrap4badge that don't have a match somewhere else?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts
WHERE id NOT IN (SELECT DISTINCT id FROM cms_cmsplugin WHERE id IS NOT NULL);

-- 16. [MEDIUM] Show me each bootstrap4 card bootstrap4card along with its related details.
SELECT t.*, c.*
FROM bootstrap4_alerts_bootstrap4alerts t
LEFT JOIN cms_cmsplugin c ON c.id = t.cmsplugin_ptr_id;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM cms_cmsplugin
LEFT JOIN bootstrap4_link_bootstrap4link ON cms_cmsplugin.id = bootstrap4_link_bootstrap4link.cmsplugin_ptr_id
LEFT JOIN bootstrap4_tabs_bootstrap4tab ON cms_cmsplugin.id = bootstrap4_tabs_bootstrap4tab.cmsplugin_ptr_id
LEFT JOIN bootstrap4_content_bootstrap4code ON cms_cmsplugin.id = bootstrap4_content_bootstrap4code.cmsplugin_ptr_id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT tag_type, COUNT(*) as cnt FROM bootstrap4_alerts_bootstrap4alerts GROUP BY tag_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tag_type ORDER BY id DESC) as rn
  FROM bootstrap4_alerts_bootstrap4alerts
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM bootstrap4_alerts_bootstrap4alerts LIMIT 10;


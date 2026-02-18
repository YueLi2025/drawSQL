-- SQLite queries for: drawSQL-mysql-export-2026-02-02_healthchecks
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM accounts_profile
WHERE next_report_date >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM accounts_profile LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM accounts_profile LIMIT 10;

-- 4. [EASY] How many accounts profile do we have?
SELECT COUNT(*) FROM accounts_profile;

-- 5. [EASY] Show me all of our accounts profile.
SELECT * FROM accounts_profile;

-- 6. [EASY] Can you look up a specific accounts profile?
SELECT * FROM accounts_profile WHERE id = ?;

-- 7. [EASY] Which accounts profile are currently active or turned on?
SELECT * FROM accounts_profile LIMIT 10;

-- 8. [EASY] What accounts profile were added or changed recently?
SELECT * FROM accounts_profile ORDER BY next_report_date DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM accounts_profile LIMIT 10;

-- 10. [MEDIUM] How many accounts profile did we have last month?
SELECT COUNT(*) FROM accounts_profile
WHERE next_report_date >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many accounts profile in each?
SELECT next_report_date, COUNT(*) as count FROM accounts_profile GROUP BY next_report_date;

-- 12. [MEDIUM] Are there any accounts profile that don't have a match somewhere else?
SELECT * FROM accounts_profile LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM accounts_profile LIMIT 10;

-- 14. [MEDIUM] Show me each accounts project along with its related details.
SELECT * FROM accounts_profile;

-- 15. [MEDIUM] Break it down by type or category—how many accounts project in each?
SELECT next_report_date, COUNT(*) as count FROM accounts_profile GROUP BY next_report_date;

-- 16. [MEDIUM] Are there any accounts project that don't have a match somewhere else?
SELECT * FROM accounts_profile LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM accounts_project
LEFT JOIN api_check ON accounts_project.owner_id = api_check.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT next_report_date, COUNT(*) as cnt FROM accounts_profile GROUP BY next_report_date
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY next_report_date ORDER BY id DESC) as rn
  FROM accounts_profile
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM api_channel
WHERE value > (SELECT AVG(value) FROM api_channel);


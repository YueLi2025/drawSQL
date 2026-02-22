-- SQLite queries for: drawSQL-mysql-export-2026-02-02_healthchecks
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM auth_user
WHERE date_joined >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT user_id, COUNT(*) as member_count FROM accounts_member GROUP BY user_id;

-- 3. [EASY] How many accounts profile do we have in total?
SELECT COUNT(*) FROM accounts_profile;

-- 4. [EASY] Show me all of our accounts profile.
SELECT * FROM accounts_profile;

-- 5. [EASY] Can you look up the accounts profile with id=num?
SELECT * FROM accounts_profile WHERE id = num;

-- 6. [EASY] How many accounts profile were created since next_report_date=date?
SELECT COUNT(*) FROM accounts_profile
WHERE next_report_date >= date('now', '-1 month');

-- 7. [EASY] What are the most recent accounts profile ordered by next_report_date?
SELECT * FROM accounts_profile ORDER BY next_report_date DESC LIMIT num;

-- 8. [EASY] How many accounts project do we have in total?
SELECT COUNT(*) FROM accounts_project;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM auth_user ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many accounts profile were added since next_report_date=date?
SELECT COUNT(*) FROM accounts_profile
WHERE next_report_date >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the accounts profile by next_report_date — how many in each?
SELECT next_report_date, COUNT(*) as count FROM accounts_profile GROUP BY next_report_date;

-- 12. [MEDIUM] Are there any accounts profile that don't have a match in related tables?
SELECT * FROM accounts_profile LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 accounts profile?
SELECT * FROM accounts_profile ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of accounts profile change month over month?
SELECT
  strftime('%Y-%m', next_report_date) as period,
  COUNT(*) as count
FROM accounts_profile
WHERE next_report_date >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which accounts profile have duplicate or repeated values?
WITH grouped AS (
  SELECT next_report_date, COUNT(*) as cnt FROM accounts_profile GROUP BY next_report_date
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] Show me each accounts project along with its related details from other tables.
SELECT t.*, c.*
FROM accounts_project t
LEFT JOIN accounts_member c ON c.project_id = t.id;

-- 17. [HARD] Pull together a report on accounts profile joining all related tables.
SELECT * FROM accounts_project
LEFT JOIN api_check ON accounts_project.owner_id = api_check.id;

-- 18. [HARD] Who or what is the best in each group of accounts profile?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY next_report_date ORDER BY id DESC) as rn
  FROM accounts_profile
) WHERE rn = num;

-- 19. [HARD] Which accounts profile are above average compared to others in their group?
SELECT
  strftime('%Y-%m', next_report_date) as period,
  COUNT(*) as count
FROM accounts_profile
WHERE next_report_date >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group accounts profile, filter, then rank the results.
WITH grouped AS (
  SELECT next_report_date, COUNT(*) as cnt FROM accounts_profile GROUP BY next_report_date
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of accounts profile over time based on next_report_date.
SELECT *, COUNT(*) OVER (ORDER BY next_report_date) as running_count
FROM accounts_profile
ORDER BY next_report_date;

-- 22. [HARD] Find accounts profile that exist in one table but not in a related table.
SELECT * FROM accounts_profile LIMIT num;

-- 23. [HARD] Combine data from accounts_profile, accounts_project, and accounts_member in a single report.
SELECT * FROM accounts_profile
LEFT JOIN accounts_project ON accounts_project.id = accounts_profile.project_id
LEFT JOIN accounts_member ON accounts_member.id = accounts_profile.id;

-- 24. [HARD] Rank all accounts profile within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM accounts_profile;


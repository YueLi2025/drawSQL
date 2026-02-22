-- SQLite queries for: drawSQL-mysql-export-2026-02-03_emails
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many team members do we have in total?
SELECT COUNT(*) FROM heya_campaign_memberships;

-- 3. [EASY] Show me all of our team members.
SELECT * FROM heya_campaign_memberships;

-- 4. [EASY] Can you look up the team member with id=num?
SELECT * FROM heya_campaign_memberships WHERE id = num;

-- 5. [EASY] How many team members were created since created_at=date?
SELECT COUNT(*) FROM heya_campaign_memberships
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent team members ordered by user_type?
SELECT * FROM heya_campaign_memberships ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many heya campaign receipts do we have in total?
SELECT COUNT(*) FROM heya_campaign_receipts;

-- 8. [EASY] Show me all of our heya campaign receipts.
SELECT * FROM heya_campaign_receipts;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many team members were added since created_at=date?
SELECT COUNT(*) FROM heya_campaign_memberships
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the team members by user_type — how many in each?
SELECT user_type, COUNT(*) as count FROM heya_campaign_memberships GROUP BY user_type;

-- 12. [MEDIUM] Are there any team members that don't have a match in related tables?
SELECT * FROM heya_campaign_memberships LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 team members?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM heya_campaign_memberships
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of team members change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM heya_campaign_memberships
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which team members have duplicate or repeated values?
WITH grouped AS (
  SELECT user_type, COUNT(*) as cnt FROM heya_campaign_memberships GROUP BY user_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many heya campaign receipts were added since created_at=date?
SELECT COUNT(*) FROM heya_campaign_receipts
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on team members joining all related tables.
SELECT * FROM heya_campaign_memberships
LEFT JOIN users ON heya_campaign_memberships.user_id = users.id;

-- 18. [HARD] Who or what is the best in each group of team members?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM heya_campaign_memberships
) WHERE rn = num;

-- 19. [HARD] Which team members are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM heya_campaign_memberships
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group team members, filter, then rank the results.
WITH grouped AS (
  SELECT user_type, COUNT(*) as cnt FROM heya_campaign_memberships GROUP BY user_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of team members over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM heya_campaign_memberships
ORDER BY created_at;

-- 22. [HARD] Find team members that exist in one table but not in a related table.
SELECT * FROM heya_campaign_memberships LIMIT num;

-- 23. [HARD] Combine data from heya_campaign_memberships, heya_campaign_receipts, and users in a single report.
SELECT * FROM heya_campaign_memberships
LEFT JOIN heya_campaign_receipts ON heya_campaign_receipts.id = heya_campaign_memberships.id
LEFT JOIN users ON users.id = heya_campaign_memberships.user_id;

-- 24. [HARD] Rank all team members within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM heya_campaign_memberships
) WHERE rn <= num;


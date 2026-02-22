-- SQLite queries for: drawSQL-mysql-export-2026-02-09_diaspora
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT aspect_id, COUNT(*) as member_count FROM aspect_memberships GROUP BY aspect_id;

-- 3. [EASY] How many account deletions do we have in total?
SELECT COUNT(*) FROM account_deletions;

-- 4. [EASY] Show me all of our account deletions.
SELECT * FROM account_deletions;

-- 5. [EASY] Can you look up the account deletion with id=num?
SELECT * FROM account_deletions WHERE id = num;

-- 6. [EASY] How many account deletions were created since completed_at=date?
SELECT COUNT(*) FROM account_deletions
WHERE completed_at >= date('now', '-1 month');

-- 7. [EASY] What are the most recent account deletions ordered by person_id?
SELECT * FROM account_deletions ORDER BY completed_at DESC LIMIT num;

-- 8. [EASY] How many team members do we have in total?
SELECT COUNT(*) FROM account_deletions;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many account deletions were added since completed_at=date?
SELECT COUNT(*) FROM account_deletions
WHERE completed_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the account deletions by person_id — how many in each?
SELECT person_id, COUNT(*) as count FROM account_deletions GROUP BY person_id;

-- 12. [MEDIUM] Are there any account deletions that don't have a match in related tables?
SELECT * FROM account_deletions LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 account deletions?
SELECT * FROM account_deletions ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of account deletions change month over month?
SELECT
  strftime('%Y-%m', completed_at) as period,
  COUNT(*) as count
FROM account_deletions
WHERE completed_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which account deletions have duplicate or repeated values?
WITH grouped AS (
  SELECT person_id, COUNT(*) as cnt FROM account_deletions GROUP BY person_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many team members were added since created_at=date?
SELECT COUNT(*) FROM account_deletions
WHERE completed_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on account deletions joining all related tables.
SELECT * FROM aspects;

-- 18. [HARD] Who or what is the best in each group of account deletions?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY id DESC) as rn
  FROM account_deletions
) WHERE rn = num;

-- 19. [HARD] Which account deletions are above average compared to others in their group?
SELECT
  strftime('%Y-%m', completed_at) as period,
  COUNT(*) as count
FROM account_deletions
WHERE completed_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group account deletions, filter, then rank the results.
WITH grouped AS (
  SELECT person_id, COUNT(*) as cnt FROM account_deletions GROUP BY person_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of account deletions over time based on completed_at.
SELECT *, COUNT(*) OVER (ORDER BY completed_at) as running_count
FROM account_deletions
ORDER BY completed_at;

-- 22. [HARD] Find account deletions that exist in one table but not in a related table.
SELECT * FROM account_deletions LIMIT num;

-- 23. [HARD] Combine data from account_deletions, aspect_memberships, and aspect_visibilities in a single report.
SELECT * FROM account_deletions
LEFT JOIN aspect_memberships ON aspect_memberships.id = account_deletions.id
LEFT JOIN aspect_visibilities ON aspect_visibilities.id = account_deletions.id;

-- 24. [HARD] Rank all account deletions within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM account_deletions;


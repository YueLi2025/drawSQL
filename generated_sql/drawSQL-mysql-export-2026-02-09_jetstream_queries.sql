-- SQLite queries for: drawSQL-mysql-export-2026-02-09_jetstream
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many members are on each team?
SELECT team_id, COUNT(*) as member_count FROM team_user GROUP BY team_id;

-- 3. [EASY] How many personal access tokens do we have in total?
SELECT COUNT(*) FROM personal_access_tokens;

-- 4. [EASY] Show me all of our personal access tokens.
SELECT * FROM personal_access_tokens;

-- 5. [EASY] Can you look up the personal access token with id=num?
SELECT * FROM personal_access_tokens WHERE id = num;

-- 6. [EASY] Find the personal access token where name=string.
SELECT * FROM personal_access_tokens WHERE name = string;

-- 7. [EASY] How many personal access tokens were created since created_at=date?
SELECT COUNT(*) FROM personal_access_tokens
WHERE created_at >= date('now', '-1 month');

-- 8. [EASY] What are the most recent personal access tokens ordered by tokenable_type?
SELECT * FROM personal_access_tokens ORDER BY created_at DESC LIMIT num;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many personal access tokens were added since created_at=date?
SELECT COUNT(*) FROM personal_access_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the personal access tokens by tokenable_type — how many in each?
SELECT tokenable_type, COUNT(*) as count FROM personal_access_tokens GROUP BY tokenable_type;

-- 12. [MEDIUM] Are there any personal access tokens that don't have a match in related tables?
SELECT * FROM personal_access_tokens LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 personal access tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tokenable_type ORDER BY id DESC) as rn
  FROM personal_access_tokens
) WHERE rn <= num;

-- 14. [MEDIUM] How did the number of personal access tokens change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM personal_access_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which personal access tokens have duplicate or repeated values?
WITH grouped AS (
  SELECT tokenable_type, COUNT(*) as cnt FROM personal_access_tokens GROUP BY tokenable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many users were added since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on personal access tokens joining all related tables.
SELECT * FROM team_user
LEFT JOIN users ON team_user.user_id = users.id
LEFT JOIN teams ON team_user.team_id = teams.id;

-- 18. [HARD] Who or what is the best in each group of personal access tokens?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tokenable_type ORDER BY id DESC) as rn
  FROM personal_access_tokens
) WHERE rn = num;

-- 19. [HARD] Which personal access tokens are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM personal_access_tokens
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group personal access tokens, filter, then rank the results.
WITH grouped AS (
  SELECT tokenable_type, COUNT(*) as cnt FROM personal_access_tokens GROUP BY tokenable_type
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of personal access tokens over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM personal_access_tokens
ORDER BY created_at;

-- 22. [HARD] Find personal access tokens that exist in one table but not in a related table.
SELECT * FROM personal_access_tokens LIMIT num;

-- 23. [HARD] Combine data from personal_access_tokens, team_user, and teams in a single report.
SELECT * FROM personal_access_tokens
LEFT JOIN team_user ON team_user.id = personal_access_tokens.id
LEFT JOIN teams ON teams.id = personal_access_tokens.team_id;

-- 24. [HARD] Rank all personal access tokens within their groups and show the top performers.
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tokenable_type ORDER BY id DESC) as rn
  FROM personal_access_tokens
) WHERE rn <= num;


-- SQLite queries for: drawSQL-mysql-export-2026-02-09_jetstream
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many people are on each team?
SELECT * FROM personal_access_tokens LIMIT 10;

-- 3. [EASY] Which invitations haven't been accepted yet?
SELECT * FROM personal_access_tokens LIMIT 10;

-- 4. [EASY] How many personal access tokens do we have?
SELECT COUNT(*) FROM personal_access_tokens;

-- 5. [EASY] Show me all of our personal access tokens.
SELECT * FROM personal_access_tokens;

-- 6. [EASY] Can you look up a specific personal access token?
SELECT * FROM personal_access_tokens WHERE id = ?;

-- 7. [EASY] Find the personal access token with a certain name or email.
SELECT * FROM personal_access_tokens WHERE name = ?;

-- 8. [EASY] What personal access tokens were added or changed recently?
SELECT * FROM personal_access_tokens ORDER BY created_at DESC LIMIT 50;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many personal access tokens did we have last month?
SELECT COUNT(*) FROM personal_access_tokens
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many personal access tokens in each?
SELECT tokenable_type, COUNT(*) as count FROM personal_access_tokens GROUP BY tokenable_type;

-- 12. [MEDIUM] Are there any personal access tokens that don't have a match somewhere else?
SELECT * FROM personal_access_tokens LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tokenable_type ORDER BY id DESC) as rn
  FROM personal_access_tokens
) WHERE rn <= 3;

-- 14. [MEDIUM] How many users did we have last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many users in each?
SELECT name, COUNT(*) as count FROM users GROUP BY name;

-- 16. [MEDIUM] Are there any users that don't have a match somewhere else?
SELECT * FROM users
WHERE id NOT IN (SELECT DISTINCT user_id FROM team_user WHERE user_id IS NOT NULL);

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM team_user
LEFT JOIN users ON team_user.user_id = users.id
LEFT JOIN teams ON team_user.team_id = teams.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT tokenable_type, COUNT(*) as cnt FROM personal_access_tokens GROUP BY tokenable_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY tokenable_type ORDER BY id DESC) as rn
  FROM personal_access_tokens
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM personal_access_tokens LIMIT 10;


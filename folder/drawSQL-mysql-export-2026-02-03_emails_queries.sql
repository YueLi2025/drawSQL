-- SQLite queries for: drawSQL-mysql-export-2026-02-03_emails
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users;

-- 2. [EASY] How many team members do we have?
SELECT COUNT(*) FROM heya_campaign_memberships;

-- 3. [EASY] Show me all of our team members.
SELECT * FROM heya_campaign_memberships;

-- 4. [EASY] Can you look up a specific team member?
SELECT * FROM heya_campaign_memberships WHERE id = ?;

-- 5. [EASY] What team members were added or changed recently?
SELECT * FROM heya_campaign_memberships ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different user type values we have?
SELECT * FROM heya_campaign_memberships LIMIT 10;

-- 7. [EASY] How many heya campaign receipts do we have?
SELECT COUNT(*) FROM heya_campaign_memberships;

-- 8. [EASY] Show me all of our heya campaign receipts.
SELECT * FROM heya_campaign_memberships;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many team members did we have last month?
SELECT COUNT(*) FROM heya_campaign_memberships
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many team members in each?
SELECT user_type, COUNT(*) as count FROM heya_campaign_memberships GROUP BY user_type;

-- 12. [MEDIUM] Are there any team members that don't have a match somewhere else?
SELECT * FROM heya_campaign_memberships LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM heya_campaign_memberships
) WHERE rn <= 3;

-- 14. [MEDIUM] How many heya campaign receipts did we have last month?
SELECT COUNT(*) FROM heya_campaign_memberships
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many heya campaign receipts in each?
SELECT user_type, COUNT(*) as count FROM heya_campaign_memberships GROUP BY user_type;

-- 16. [MEDIUM] Are there any heya campaign receipts that don't have a match somewhere else?
SELECT * FROM heya_campaign_memberships LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM heya_campaign_memberships
LEFT JOIN users ON heya_campaign_memberships.user_id = users.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT user_type, COUNT(*) as cnt FROM heya_campaign_memberships GROUP BY user_type
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_type ORDER BY id DESC) as rn
  FROM heya_campaign_memberships
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM heya_campaign_memberships LIMIT 10;


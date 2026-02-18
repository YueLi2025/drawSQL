-- SQLite queries for: drawSQL-mysql-export-2026-02-09_timegrid
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many people signed up last month?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many appointments do we have?
SELECT COUNT(*) FROM appointments;

-- 3. [EASY] Show me all of our appointments.
SELECT * FROM appointments;

-- 4. [EASY] Can you look up a specific appointment?
SELECT * FROM appointments WHERE id = ?;

-- 5. [EASY] What appointments were added or changed recently?
SELECT * FROM appointments ORDER BY created_at DESC LIMIT 50;

-- 6. [EASY] What are the different issuer id values we have?
SELECT * FROM appointments LIMIT 10;

-- 7. [EASY] How many business contact do we have?
SELECT COUNT(*) FROM appointments;

-- 8. [EASY] Show me all of our business contact.
SELECT * FROM appointments;

-- 9. [MEDIUM] Who are our most active users?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many appointments did we have last month?
SELECT COUNT(*) FROM appointments
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break it down by type or category—how many appointments in each?
SELECT issuer_id, COUNT(*) as count FROM appointments GROUP BY issuer_id;

-- 12. [MEDIUM] Are there any appointments that don't have a match somewhere else?
SELECT * FROM appointments LIMIT 10;

-- 13. [MEDIUM] For each group, what's in the top 3?
SELECT * FROM categories LIMIT 10;

-- 14. [MEDIUM] How many business contact did we have last month?
SELECT COUNT(*) FROM appointments
WHERE created_at >= date('now', '-1 month');

-- 15. [MEDIUM] Break it down by type or category—how many business contact in each?
SELECT issuer_id, COUNT(*) as count FROM appointments GROUP BY issuer_id;

-- 16. [MEDIUM] Are there any business contact that don't have a match somewhere else?
SELECT * FROM appointments LIMIT 10;

-- 17. [HARD] I need a report that pulls together info from several different places.
SELECT * FROM appointments
LEFT JOIN contacts ON appointments.contact_id = contacts.id
LEFT JOIN services ON appointments.service_id = services.id
LEFT JOIN businesses ON appointments.business_id = businesses.id;

-- 18. [HARD] Can you do a multi-step analysis: group things, filter, then rank the results?
WITH grouped AS (
  SELECT issuer_id, COUNT(*) as cnt FROM appointments GROUP BY issuer_id
)
SELECT * FROM grouped WHERE cnt > 1 ORDER BY cnt DESC;

-- 19. [HARD] Who or what is the best in each group?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY issuer_id ORDER BY id DESC) as rn
  FROM appointments
) WHERE rn = 1;

-- 20. [HARD] Which ones are above average compared to others in their group?
SELECT * FROM preferences t1
WHERE value > (
  SELECT AVG(value) FROM preferences t2 WHERE t2.preferenceable_type = t1.preferenceable_type
);


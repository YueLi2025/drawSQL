-- SQLite queries for: drawSQL-mysql-export-2026-02-09_timegrid
-- Generated from natural language questions
============================================================

-- 1. [EASY] How many users signed up since created_at=date?
SELECT COUNT(*) FROM users
WHERE created_at >= date('now', '-1 month');

-- 2. [EASY] How many appointments do we have in total?
SELECT COUNT(*) FROM appointments;

-- 3. [EASY] Show me all of our appointments.
SELECT * FROM appointments;

-- 4. [EASY] Can you look up the appointment with id=num?
SELECT * FROM appointments WHERE id = num;

-- 5. [EASY] How many appointments were created since created_at=date?
SELECT COUNT(*) FROM appointments
WHERE created_at >= date('now', '-1 month');

-- 6. [EASY] What are the most recent appointments ordered by issuer_id?
SELECT * FROM appointments ORDER BY created_at DESC LIMIT num;

-- 7. [EASY] How many business contact do we have in total?
SELECT COUNT(*) FROM business_contact;

-- 8. [EASY] Show me all of our business contact.
SELECT * FROM business_contact;

-- 9. [MEDIUM] Who are the most active users based on activity count?
SELECT * FROM users ORDER BY created_at DESC LIMIT 10;

-- 10. [MEDIUM] How many appointments were added since created_at=date?
SELECT COUNT(*) FROM appointments
WHERE created_at >= date('now', '-1 month');

-- 11. [MEDIUM] Break down the appointments by issuer_id — how many in each?
SELECT issuer_id, COUNT(*) as count FROM appointments GROUP BY issuer_id;

-- 12. [MEDIUM] Are there any appointments that don't have a match in related tables?
SELECT * FROM appointments LIMIT num;

-- 13. [MEDIUM] For each group, what are the top 3 appointments?
SELECT * FROM categories ORDER BY id DESC LIMIT num;

-- 14. [MEDIUM] How did the number of appointments change month over month?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM appointments
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 15. [MEDIUM] Which appointments have duplicate or repeated values?
WITH grouped AS (
  SELECT issuer_id, COUNT(*) as cnt FROM appointments GROUP BY issuer_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 16. [MEDIUM] How many business contact were added since created_at=date?
SELECT COUNT(*) FROM business_contact
WHERE created_at >= date('now', '-1 month');

-- 17. [HARD] Pull together a report on appointments joining all related tables.
SELECT * FROM appointments
LEFT JOIN contacts ON appointments.contact_id = contacts.id
LEFT JOIN services ON appointments.service_id = services.id
LEFT JOIN businesses ON appointments.business_id = businesses.id;

-- 18. [HARD] Who or what is the best in each group of appointments?
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY issuer_id ORDER BY id DESC) as rn
  FROM appointments
) WHERE rn = num;

-- 19. [HARD] Which appointments are above average compared to others in their group?
SELECT
  strftime('%Y-%m', created_at) as period,
  COUNT(*) as count
FROM appointments
WHERE created_at >= date('now', '-2 months')
GROUP BY period
ORDER BY period;

-- 20. [HARD] Do a multi-step analysis: group appointments, filter, then rank the results.
WITH grouped AS (
  SELECT issuer_id, COUNT(*) as cnt FROM appointments GROUP BY issuer_id
)
SELECT * FROM grouped WHERE cnt > num ORDER BY cnt DESC;

-- 21. [HARD] Show the running total of appointments over time based on created_at.
SELECT *, COUNT(*) OVER (ORDER BY created_at) as running_count
FROM appointments
ORDER BY created_at;

-- 22. [HARD] Find appointments that exist in one table but not in a related table.
SELECT * FROM appointments LIMIT num;

-- 23. [HARD] Combine data from appointments, business_contact, and business_user in a single report.
SELECT * FROM appointments
LEFT JOIN business_contact ON business_contact.id = appointments.id
LEFT JOIN business_user ON business_user.id = appointments.id;

-- 24. [HARD] Rank all appointments within their groups and show the top performers.
SELECT *, ROW_NUMBER() OVER (ORDER BY id DESC) as rn
FROM appointments;


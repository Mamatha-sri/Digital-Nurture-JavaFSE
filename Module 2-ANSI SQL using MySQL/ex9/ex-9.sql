/* 9. Organizer Event Summary */

SELECT
    u.full_name AS organizer,
    e.status,
    COUNT(e.event_id) AS total_events
FROM Events e
JOIN Users u
ON e.organizer_id = u.user_id
GROUP BY u.full_name, e.status;
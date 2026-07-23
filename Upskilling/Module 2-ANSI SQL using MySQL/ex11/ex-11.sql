/* 11. Daily New User Count */

SELECT
    registration_date,
    COUNT(user_id) AS total_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;
--https://livesql.oracle.com/;
SELECT floor_number, COUNT(*) as count
FROM Employee e
JOIN HealthStatus hs ON e.ID = hs.employee_ID
WHERE hs.status = 'sick'
GROUP BY floor_number
ORDER BY count DESC
FETCH FIRST 1 ROWS ONLY;
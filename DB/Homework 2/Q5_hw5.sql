--https://livesql.oracle.com/;
SELECT e.ID, e.name 
FROM Employee e
JOIN Scan s ON e.ID = s.employee_ID
WHERE s.temperature > 100.0;


SELECT COUNT(*) AS "Number of Meetings After 3 PM"
FROM Meeting
WHERE meeting_start_time > 15;



SELECT COUNT(DISTINCT e.ID) AS "Number of Employees who are hospitalized and sick"
FROM Employee e
JOIN HealthStatus hs1 ON e.ID = hs1.employee_ID AND hs1.status = 'hospitalized'
JOIN HealthStatus hs2 ON e.ID = hs2.employee_ID AND hs2.status = 'sick'
WHERE NOT EXISTS (
    SELECT 1 
    FROM HealthStatus hs3
    WHERE hs3.employee_ID = e.ID AND hs3.status = 'well'
);


SELECT floor_number, COUNT(*) AS "Number of Meetings"
FROM Meeting
GROUP BY floor_number
ORDER BY "Number of Meetings" DESC
FETCH FIRST 1 ROWS ONLY;

--extra credit question 5
CREATE VIEW EmployeeTestResults AS
SELECT e.ID AS EmployeeID, e.name AS EmployeeName, t.test_result AS TestResult
FROM Employee e
LEFT JOIN Test t ON e.ID = t.employee_ID;

-- Step 1: Derive a table with all distinct room numbers on floor number 5 from the Meeting table where meetings were actually held
WITH RoomsWithMeetingsOnFloor5 AS (
    SELECT DISTINCT room_number
    FROM Meeting
    WHERE floor_number = 5
),

EmployeesWithSymptoms AS (
    SELECT DISTINCT employee_ID
    FROM Symptom
)

-- Step 2: Divide the Meeting table by RoomsWithMeetingsOnFloor5
SELECT e.ID, e.name
FROM Employee e
JOIN EmployeesWithSymptoms ews ON e.ID = ews.employee_ID
WHERE e.age BETWEEN 25 AND 29
AND NOT EXISTS (
    SELECT 1
    FROM RoomsWithMeetingsOnFloor5 r
    WHERE NOT EXISTS (
        SELECT 1
        FROM Meeting m
        WHERE m.employee_ID = e.ID AND m.room_number = r.room_number
    )
)
ORDER BY e.ID;

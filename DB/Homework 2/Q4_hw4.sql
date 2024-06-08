--https://livesql.oracle.com/;
SELECT COUNT(*) AS "Number of Scans"
FROM Scan
WHERE scan_date BETWEEN TO_DATE('2023-10-1', 'YYYY-MM-DD') AND TO_DATE('2023-10-07', 'YYYY-MM-DD');

SELECT COUNT(*) AS "Number of Tests"
FROM Test
WHERE test_date BETWEEN TO_DATE('2023-10-01', 'YYYY-MM-DD') AND TO_DATE('2023-10-06', 'YYYY-MM-DD');

SELECT COUNT(DISTINCT employee_ID) AS "Number of Employees Reported Symptoms"
FROM Symptom
WHERE date_reported BETWEEN TO_DATE('2023-10-01', 'YYYY-MM-DD') AND TO_DATE('2023-10-05', 'YYYY-MM-DD');

SELECT COUNT(*) AS "Number of Positive Cases"
FROM Test
WHERE test_date BETWEEN TO_DATE('2023-10-01', 'YYYY-MM-DD') AND TO_DATE('2023-10-15', 'YYYY-MM-DD')
AND test_result = 'positive';

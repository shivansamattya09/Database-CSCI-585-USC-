--https://livesql.oracle.com/;
SELECT symptom_ID, COUNT(*) as total_reports
FROM Symptom
GROUP BY symptom_ID
ORDER BY total_reports DESC
FETCH FIRST 1 ROWS ONLY;
SELECT
    l.test_date,
    l.test_type,
    l.test_result,
    p.patient_id,
    p.patient_name,
    p.patient_dob
FROM lab_results l
JOIN patients p ON l.patient_id = p.patient_id
WHERE p.patient_dob < CURDATE() - INTERVAL 60 YEAR
ORDER BY l.test_date DESC;
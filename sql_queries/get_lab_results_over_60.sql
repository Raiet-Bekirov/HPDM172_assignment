SELECT
    lr.test_date,
    lr.test_type,
    lr.test_result,
    p.patient_id,
    p.patient_name,
    p.patient_dob
FROM lab_results lr
JOIN patients p ON lr.patient_id = p.patient_id
WHERE p.patient_dob < CURDATE() - INTERVAL 60 YEAR
ORDER BY lr.test_date DESC;
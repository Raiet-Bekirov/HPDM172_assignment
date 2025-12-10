SELECT
    l.test_date,
    l.test_type,
    l.test_result,
    p.patient_name,
    d.doctor_name,
    h.hospital_name,
    h.accreditation_year
FROM lab_results l
JOIN patients p ON l.patient_id = p.patient_id
JOIN doctors d ON l.doctor_id = d.doctor_id
JOIN hospitals h ON d.hospital_id = h.hospital_id
WHERE h.accreditation_year BETWEEN 2013 AND 2020
ORDER BY l.test_date DESC;
SELECT
    d.doctor_id,
    d.doctor_name,
    h.hospital_name,
    COUNT(pr.prescription_id) AS total_prescriptions
FROM doctors d
JOIN prescriptions pr ON d.doctor_id = pr.doctor_id
JOIN hospitals h ON d.hospital_id = h.hospital_id
GROUP BY
    d.doctor_id,
    d.doctor_name
ORDER BY total_prescriptions DESC
LIMIT 1;
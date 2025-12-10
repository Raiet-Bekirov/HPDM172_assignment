SELECT
    pr.prescription_id,
    pr.prescription_date,
    p.patient_name,
    d.doctor_name,
    m.medication_name
FROM prescriptions pr
JOIN patients    p ON pr.patient_id    = p.patient_id
JOIN medications m ON pr.medication_id = m.medication_id
JOIN doctors     d ON pr.doctor_id     = d.doctor_id
ORDER BY
    SUBSTRING_INDEX(p.patient_name, ' ', -1) ASC,
    pr.prescription_date DESC;
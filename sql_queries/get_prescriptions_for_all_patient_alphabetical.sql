SELECT
    p.patient_name,
    pr.prescription_id,
    pr.prescription_date,
    m.medication_name,
    d.doctor_name
FROM prescriptions pr
JOIN patients    p ON pr.patient_id    = p.patient_id
JOIN medications m ON pr.medication_id = m.medication_id
JOIN doctors     d ON pr.doctor_id     = d.doctor_id
ORDER BY
    p.patient_name ASC,       
    pr.prescription_date ASC;   
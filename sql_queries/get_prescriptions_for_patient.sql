SELECT
    pr.prescription_id,
    pr.prescription_date,
    p.patient_name,
    d.doctor_name,
    m.medication_name
FROM prescriptions AS pr
JOIN patients    AS p ON pr.patient_id  = p.patient_id
JOIN medications AS m ON pr.medication_id = m.medication_id
JOIN doctors     AS d ON pr.doctor_id  = d.doctor_id
WHERE p.patient_id = @PatientID
ORDER BY pr.prescription_date DESC;
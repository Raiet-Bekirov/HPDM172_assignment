SELECT 
    pr.prescription_id,
    pr.prescription_date,
    m.medication_name,
    d.doctor_name
FROM prescriptions AS pr
JOIN patients    AS p ON pr.patient_id  = p.patient_id
JOIN medications AS m ON pr.medication_id = m.medication_id
JOIN doctors     AS d ON pr.doctor_id  = d.doctor_id
WHERE p.patient_name = @PatientName
ORDER BY pr.prescription_date;

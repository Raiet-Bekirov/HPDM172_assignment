SELECT 
    a.appointment_date,
    p.patient_name,
    d.doctor_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE p.patient_id = @PatientID
ORDER BY a.appointment_date ASC;

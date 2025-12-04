
SELECT 
    a.appointment_date, 
    p.patient_name,
    d.doctor_name
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id
WHERE d.doctor_id = @DoctorID;

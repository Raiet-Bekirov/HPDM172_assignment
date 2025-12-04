
SELECT 
p.patient_name,
a.appointment_date
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN patients p ON a.patient_id = p.patient_id
WHERE d.doctor_name = 'Dr. Alexander Iskakov';

SELECT
    p.prescription_id,
    p.prescription_date,
    d.doctor_name,
    pa.patient_name,
    m.medication_name
FROM prescriptions AS p
JOIN doctors      AS d  ON p.doctor_id    = d.doctor_id
JOIN patients     AS pa ON p.patient_id   = pa.patient_id
JOIN medications  AS m  ON p.medication_id = m.medication_id
WHERE d.doctor_name = @DoctorName       -- or  d.doctor_id = @DoctorID
ORDER BY p.prescription_date;

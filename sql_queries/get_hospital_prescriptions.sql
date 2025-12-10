SELECT
	m.medication_name,
	d.doctor_name,
    p.patient_name,
    h.hospital_name
FROM prescriptions pr
JOIN medications m ON pr.medication_id = m.medication_id
JOIN doctors d ON pr.doctor_id = d.doctor_id
JOIN patients p ON pr.patient_id = p.patient_id
JOIN hospitals h ON d.hospital_id = h.hospital_id
WHERE h.hospital_id = @HospitalID
ORDER BY
    m.medication_name ASC;
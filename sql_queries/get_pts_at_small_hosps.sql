SELECT
	p.patient_id,
	p.patient_name,
	d.doctor_id,
	d.doctor_name,
	h.hospital_name
FROM patients p
JOIN doctors d ON p.doctor_id = d.doctor_id
JOIN hospitals h ON d.hospital_id = h.hospital_id
WHERE h.no_of_beds < 400
ORDER BY 
	h.no_of_beds ASC,
	p.patient_id ASC;
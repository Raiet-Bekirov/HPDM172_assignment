SELECT
	d.doctor_id,
	d.doctor_name,
	h.hospital_name
FROM doctors d
JOIN hospitals h ON d.hospital_id = h.hospital_id
WHERE h.hospital_id = @HospitalID;
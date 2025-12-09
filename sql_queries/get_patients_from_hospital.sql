SELECT DISTINCT
    p.patient_name,
    p.patient_address
FROM patients   AS p
JOIN doctors    AS d ON p.doctor_id   = d.doctor_id
JOIN hospitals  AS h ON d.hospital_id = h.hospital_id
WHERE h.hospital_id = @HospitalId   -- or by name WHERE h.hospital_name = @HospitalName
ORDER BY p.patient_name;

SELECT 
    d.doctor_id,
    d.doctor_name,
    h.hospital_name,
    h.accreditation_year
FROM doctors AS d
JOIN hospitals AS h
    ON d.hospital_id = h.hospital_id
WHERE h.hospital_type = 'Teaching'
  AND h.accreditation_year BETWEEN 2015 AND 2024
ORDER BY d.doctor_name;

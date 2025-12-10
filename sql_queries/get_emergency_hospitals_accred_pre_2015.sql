SELECT
	h.hospital_id,
	h.hospital_name,
	h.accreditation_year
FROM hospitals h
WHERE h.accreditation_year < 2015 AND h.emergency_services = 'Yes'
ORDER BY h.accreditation_year DESC;
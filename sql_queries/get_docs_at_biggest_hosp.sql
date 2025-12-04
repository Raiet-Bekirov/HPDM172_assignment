SELECT
    d.doctor_id,
    d.doctor_name
FROM doctors d
JOIN hospitals h ON d.hospital_id = h.hospital_id
WHERE h.no_of_beds = (
    SELECT MAX(no_of_beds)
    FROM hospitals
);
SELECT
d.doctor_id,
d.doctor_name,
ds.disease_name,
h.hospital_name
FROM doctors d
JOIN diseases ds ON ds.disease_id = d.disease_id
JOIN hospitals h ON h.hospital_id = d.hospital_id
WHERE ds.disease_id = @DiseaseID;

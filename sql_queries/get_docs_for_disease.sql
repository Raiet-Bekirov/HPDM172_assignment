SELECT
d.doctor_id,
d.doctor_name,
ds.disease_name
FROM doctors d
JOIN diseases ds ON ds.disease_id = d.disease_id
WHERE ds.disease_id = @DiseaseID;

SELECT DISTINCT
    p.patient_id,
    p.patient_name,
    d.disease_name,
    m.medication_name
FROM patients       AS p
JOIN prescriptions  AS pr  ON p.patient_id   = pr.patient_id
JOIN medications    AS m   ON pr.medication_id = m.medication_id
JOIN diseases       AS d   ON m.disease_id  = d.disease_id
WHERE d.disease_id = @DiseaseId;       -- or by name  WHERE d.disease_name = @DiseaseName

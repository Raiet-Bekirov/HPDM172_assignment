SET @Pt2UpdateID = 56
SET @Address2Update = '221B Baker Street, London NW1 6XE'

UPDATE patients
SET patient_address= @Address2Update
WHERE patient_id = @Pt2UpdateID;

SELECT * FROM patients
WHERE patient_id = 56;
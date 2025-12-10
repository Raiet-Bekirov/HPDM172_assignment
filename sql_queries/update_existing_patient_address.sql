UPDATE patients
SET patient_address= @Address2Update
WHERE patient_id = @Pt2UpdateID;
SET @NewPtID = (SELECT MAX(patient_id) FROM patients) + 1;
INSERT INTO patients (patient_id, patient_name, patient_dob, patient_address, doctor_id)
VALUES (@NewPtID, @NewPtName, @NewPtDOB, @NewPtAddress, @NewPtDocID);
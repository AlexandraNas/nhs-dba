ALTER TABLE Patients ADD COLUMN PasswordHash VARCHAR(64) NOT NULL; 
ALTER TABLE Appointments MODIFY COLUMN Diagnosis VARBINARY(255);

-- Set HASH
UPDATE Patients 
SET PasswordHash = SHA2('PatientSuperSecretPass123!', 256)
WHERE PatientID = 1;
SET @encryption_key = 'MyUltimateSecretNHSKey2026!'; 
 
-- Encrypting John Doe's diagnosis ('Hypertension')
INSERT INTO Appointments (AppointmentDate, AppointmentTime, Notes, ClinicID, PatientID, DoctorID, Diagnosis, PhoneOrFace, Status) 
VALUES ('2026-06-25', '09:00:00', 'Routine checkup', 1, 1, 1,   
        AES_ENCRYPT('Hypertension', @encryption_key), FALSE, 'Completed'); 
 
-- Decrypting the data to read John Doe's diagnosis
SELECT AppointmentID, AppointmentDate,   
       CAST(AES_DECRYPT(Diagnosis, @encryption_key) AS CHAR(255)) AS DecryptedDiagnosis 
FROM Appointments 
WHERE PatientID = 1;
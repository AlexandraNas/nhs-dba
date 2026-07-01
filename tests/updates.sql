-- Insert the first patient record
INSERT INTO Patients (PatientName, PatientSurname, PhoneNumber, Email, NHSnumber, Address, DateBirth, ActiveOrNot)
VALUES ('John', 'Doe', 447123456789, 'john.doe@email.com', 1234567890, '123 High Street, London', '1990-05-15', TRUE);

-- Insert the second patient record
INSERT INTO Patients (PatientName, PatientSurname, PhoneNumber, Email, NHSnumber, Address, DateBirth, ActiveOrNot)
VALUES ('Jane', 'Smith', 447987654321, 'jane.smith@email.com', 9876543210, '456 Church Road, Manchester', '1985-11-22', TRUE);
-- Update John Doe's phone number and address
UPDATE Patients 
SET PhoneNumber = 447000000000, Address = '789 New Way, London'
WHERE PatientName = 'John' AND PatientSurname = 'Doe';

-- Update Jane Smith's status to inactive
UPDATE Patients 
SET ActiveOrNot = FALSE
WHERE PatientName = 'Jane' AND PatientSurname = 'Smith';
-- Delete John Doe's record
DELETE FROM Patients 
WHERE PatientName = 'John' AND PatientSurname = 'Doe';

-- Delete Jane Smith's record
DELETE FROM Patients 
WHERE PatientName = 'Jane' AND PatientSurname = 'Smith';
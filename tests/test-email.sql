INSERT INTO Patients
(PatientName, PatientSurname, PhoneNumber, Email, NHSnumber,
Address, DateBirth, ActiveOrNot, PasswordHash)
VALUES
('John','Smith',07123456789,'johnsmith',1234567890,
'1 High Street','1995-05-12',1,SHA2('password123',256));

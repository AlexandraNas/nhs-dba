-- Aggregate functions
SELECT 
    c.ClinicName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedAppointments,
    ROUND((SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) / COUNT(a.AppointmentID)) * 100, 2) AS CompletionRatePercentage
FROM Clinics c
LEFT JOIN Appointments a ON c.ClinicID = a.ClinicID
GROUP BY c.ClinicID, c.ClinicName;

-- Dense rank
SELECT 
    d.Speciality,
    CONCAT(d.DoctorName, ' ', d.DoctorSurname) AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    DENSE_RANK() OVER (PARTITION BY d.Speciality ORDER BY COUNT(a.AppointmentID) DESC) AS DoctorRankWithinSpecialty
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Speciality, d.DoctorName, d.DoctorSurname;

-- HASH query
SELECT PatientName, PatientSurname, Email, PasswordHash 
FROM Patients 
WHERE PatientID = 1;

-- Various joins
SELECT 
    p.PrescriptionID,
    p.DateIssued,
    m.MedicationName,
    CONCAT(pat.PatientName, ' ', pat.PatientSurname) AS PatientName,
    CONCAT(d.DoctorName, ' ', d.DoctorSurname) AS DoctorName,
    p.AppointmentID
FROM Prescriptions p
JOIN Medications m ON p.MedicationID = m.MedicationID
JOIN Patients pat ON p.PatientID = pat.PatientID
LEFT JOIN Doctors d ON p.DoctorID = d.DoctorID
WHERE p.DoctorID IS NULL OR p.AppointmentID IS NULL;

-- Create trigger
DELIMITER //

CREATE TRIGGER trg_Before_Doctor_Insert
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    SET NEW.Speciality = UPPER(NEW.Speciality);
END //

DELIMITER ;

-- Create stored procedure
DELIMITER //

CREATE PROCEDURE BookAppointment(
    IN p_AppointmentDate DATE,
    IN p_AppointmentTime TIME,
    IN p_PatientID BIGINT,
    IN p_DoctorID BIGINT,
    IN p_Notes TEXT
)
BEGIN
    DECLARE v_ClinicID BIGINT;

    -- Find the ClinicID where the doctor works
    SELECT ClinicID INTO v_ClinicID 
    FROM Doctors 
    WHERE DoctorID = p_DoctorID;

    -- Insert the appointment
    INSERT INTO Appointments (AppointmentDate, AppointmentTime, ClinicID, PatientID, DoctorID, Notes, Status)
    VALUES (p_AppointmentDate, p_AppointmentTime, v_ClinicID, p_PatientID, p_DoctorID, p_Notes, 'Scheduled');
END //

DELIMITER ;

-- Test appointments
INSERT INTO Appointments
(AppointmentDate, AppointmentTime, ClinicID,
PatientID, DoctorID)
VALUES
('2026-05-18','21:30:00',1,1,1);

-- Test duplicate appointment
INSERT INTO Appointments
(AppointmentDate, AppointmentTime, ClinicID,
PatientID, DoctorID)
VALUES
('2026-05-18','10:00:00',1,1,1);

-- Test email
INSERT INTO Patients
(PatientName, PatientSurname, PhoneNumber, Email, NHSnumber,
Address, DateBirth, ActiveOrNot, PasswordHash)
VALUES
('John','Smith',07123456789,'johnsmith',1234567890,
'1 High Street','1995-05-12',1,SHA2('password123',256));

-- Referential integrity
INSERT INTO Appointments
(AppointmentDate, AppointmentTime,
ClinicID, PatientID, DoctorID)
VALUES
('2026-05-20','11:00:00',
999,1,1);


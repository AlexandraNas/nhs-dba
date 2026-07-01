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

SELECT 
    d.Speciality,
    CONCAT(d.DoctorName, ' ', d.DoctorSurname) AS DoctorName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    DENSE_RANK() OVER (PARTITION BY d.Speciality ORDER BY COUNT(a.AppointmentID) DESC) AS DoctorRankWithinSpecialty
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Speciality, d.DoctorName, d.DoctorSurname;
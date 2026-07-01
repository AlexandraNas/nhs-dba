SELECT 
    c.ClinicName,
    COUNT(a.AppointmentID) AS TotalAppointments,
    SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedAppointments,
    ROUND((SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) / COUNT(a.AppointmentID)) * 100, 2) AS CompletionRatePercentage
FROM Clinics c
LEFT JOIN Appointments a ON c.ClinicID = a.ClinicID
GROUP BY c.ClinicID, c.ClinicName;
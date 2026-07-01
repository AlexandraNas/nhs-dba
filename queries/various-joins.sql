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
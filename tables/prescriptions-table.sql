-- 6. Create Prescriptions Table
CREATE TABLE `Prescriptions` (
  `PrescriptionID` bigint NOT NULL AUTO_INCREMENT,
  `AppointmentID` bigint DEFAULT NULL,
  `MedicationID` bigint NOT NULL,
  `RepeatedPrescription` tinyint(1) NOT NULL DEFAULT '0',
  `Dosage` varchar(100) NOT NULL,
  `DateIssued` date NOT NULL,
  `PatientID` bigint NOT NULL,
  `DoctorID` bigint DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `FK_Prescription_Medication` (`MedicationID`),
  KEY `FK_Prescription_Patient` (`PatientID`),
  KEY `FK_Prescription_Doctor` (`DoctorID`),
  KEY `FK_Prescription_Appointment` (`AppointmentID`),
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointments` (`AppointmentID`),
  CONSTRAINT `FK_Prescription_Doctor` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors` (`DoctorID`),
  CONSTRAINT `FK_Prescription_Medication` FOREIGN KEY (`MedicationID`) REFERENCES `Medications` (`MedicationID`),
  CONSTRAINT `FK_Prescription_Patient` FOREIGN KEY (`PatientID`) REFERENCES `Patients` (`PatientID`)

);
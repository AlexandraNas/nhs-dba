-- 5. Create Appointments Table
CREATE TABLE `Appointments` (
  `AppointmentID` bigint NOT NULL AUTO_INCREMENT,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `Notes` text,
  `ClinicID` bigint NOT NULL,
  `PatientID` bigint NOT NULL,
  `DoctorID` bigint NOT NULL,
  `Diagnosis` varbinary(255) DEFAULT NULL,
  `PhoneOrFace` tinyint(1) NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT 'Scheduled',
  PRIMARY KEY (`AppointmentID`),
  UNIQUE KEY `uq_patient_slot` (`PatientID`,`AppointmentDate`,`AppointmentTime`),
  KEY `FK_Appointment_Clinic` (`ClinicID`),
  KEY `FK_Appointment_Doctor` (`DoctorID`),
  CONSTRAINT `FK_Appointment_Clinic` FOREIGN KEY (`ClinicID`) REFERENCES `Clinics` (`ClinicID`),
  CONSTRAINT `FK_Appointment_Doctor` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors` (`DoctorID`),
  CONSTRAINT `FK_Appointment_Patient` FOREIGN KEY (`PatientID`) REFERENCES `Patients` (`PatientID`),
  CONSTRAINT `chk_appointment_day` CHECK ((dayofweek(`AppointmentDate`) between 2 and 6)),
  CONSTRAINT `chk_appointment_time` CHECK (((hour(`AppointmentTime`) >= 8) and (hour(`AppointmentTime`) < 20)))

);
CREATE DATABASE NHS_Trust_DB;
USE NHS_Trust_DB;

-- 1. Create Medications Table
CREATE TABLE Medications (
    MedicationID BIGINT NOT NULL AUTO_INCREMENT,
    MedicationName VARCHAR(150) NOT NULL,
    Descritption TEXT,
    PRIMARY KEY (MedicationID)
);
-- 2. Create Patients Table
CREATE TABLE `Patients` (
  `PatientID` bigint NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(50) NOT NULL,
  `PatientSurname` varchar(50) NOT NULL,
  `PhoneNumber` bigint NOT NULL,
  `Email` varchar(100) NOT NULL,
  `NHSnumber` bigint NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DateBirth` date NOT NULL,
  `ActiveOrNot` tinyint(1) DEFAULT '1',
  `PasswordHash` varchar(64) NOT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `unique_patient` (`PatientName`,`PatientSurname`,`DateBirth`),
  CONSTRAINT `chk_patient_datebirth` CHECK ((`DateBirth` between '1920-01-01' and '2026-12-31')),
  CONSTRAINT `chk_patient_email` CHECK ((`Email` like '%@%.%'))
);
-- 3. Create Clinics Table
CREATE TABLE `Clinics` (
  `ClinicID` bigint NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(150) NOT NULL,
  `ClinicAddress` varchar(255) DEFAULT NULL,
  `PhoneNumber` bigint NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`),
  CONSTRAINT `chk_clinic_email` CHECK ((`Email` like '%@%.%'))

);
-- 4. Create Doctors Table
CREATE TABLE `Doctors` (
  `DoctorID` bigint NOT NULL AUTO_INCREMENT,
  `ClinicID` bigint NOT NULL,
  `DoctorName` varchar(50) NOT NULL,
  `DoctorSurname` varchar(50) NOT NULL,
  `Speciality` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` bigint NOT NULL,
  `DateBirth` date NOT NULL,
  `ActiveOrNot` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`DoctorID`),
  UNIQUE KEY `unique_doctor` (`DoctorName`,`DoctorSurname`,`DateBirth`),
  KEY `fk_doctor_clinic` (`ClinicID`),
  CONSTRAINT `fk_doctor_clinic` FOREIGN KEY (`ClinicID`) REFERENCES `Clinics` (`ClinicID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_doctor_datebirth` CHECK ((`DateBirth` between '1920-01-01' and '2001-12-31')),
  CONSTRAINT `chk_doctor_email` CHECK ((`Email` like '%@%.%'))
);
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

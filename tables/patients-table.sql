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
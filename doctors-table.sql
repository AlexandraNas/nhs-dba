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

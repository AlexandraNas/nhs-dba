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
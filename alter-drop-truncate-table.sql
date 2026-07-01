-- A. CREATE
CREATE TABLE Specialities (
    SpecialityID BIGINT NOT NULL AUTO_INCREMENT,
    SpecialityName VARCHAR(100) NOT NULL,
    ClinicID BIGINT NOT NULL,
    PRIMARY KEY (SpecialityID),
    CONSTRAINT FK_Speciality_Clinic FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID)
);
 
-- B. ALTER
ALTER TABLE Specialities 
ADD COLUMN Description TEXT;
 
-- C. TRUNCATE
TRUNCATE TABLE Specialities;
 
-- D. DROP
DROP TABLE Specialities;
 
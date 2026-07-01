CREATE DATABASE NHS_Trust_DB;
USE NHS_Trust_DB;

-- 1. Create Medications Table
CREATE TABLE Medications (
    MedicationID BIGINT NOT NULL AUTO_INCREMENT,
    MedicationName VARCHAR(150) NOT NULL,
    Descritption TEXT,
    PRIMARY KEY (MedicationID)
);

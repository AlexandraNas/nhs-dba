-- Create roles
CREATE ROLE doctor_role, receptionist_role, admin_role, patient_role;

-- Doctor role privileges
GRANT SELECT, INSERT, UPDATE ON NHS_Trust_DB.Appointments TO doctor_role;
GRANT SELECT, INSERT, UPDATE ON NHS_Trust_DB.Prescriptions TO doctor_role;
GRANT SELECT ON NHS_Trust_DB.Patients TO doctor_role;
GRANT SELECT ON NHS_Trust_DB.Medications TO doctor_role;

-- Receptionist role privileges
GRANT SELECT, INSERT, UPDATE ON NHS_Trust_DB.Patients TO receptionist_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON NHS_Trust_DB.Appointments TO receptionist_role;
GRANT SELECT ON NHS_Trust_DB.Clinics TO receptionist_role;
GRANT SELECT ON NHS_Trust_DB.Doctors TO receptionist_role;

-- Admin role privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON NHS_Trust_DB.Clinics TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON NHS_Trust_DB.Doctors TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON NHS_Trust_DB.Medications TO admin_role;
GRANT SELECT ON NHS_Trust_DB.Patients TO admin_role;

-- Patient role privileges
GRANT SELECT ON NHS_Trust_DB.Medications TO patient_role;

-- Create users
CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'Doctor123!';
CREATE USER 'receptionist'@'localhost' IDENTIFIED BY 'Reception123!';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Admin123!';
CREATE USER 'patient'@'localhost' IDENTIFIED BY 'Patient123!';

-- Assign roles to users
GRANT doctor_role TO 'doctor'@'localhost';
GRANT receptionist_role TO 'receptionist'@'localhost';
GRANT admin_role TO 'admin'@'localhost';
GRANT patient_role TO 'patient'@'localhost';

-- Set default roles
SET DEFAULT ROLE doctor_role TO 'doctor'@'localhost';
SET DEFAULT ROLE receptionist_role TO 'receptionist'@'localhost';
SET DEFAULT ROLE admin_role TO 'admin'@'localhost';
SET DEFAULT ROLE patient_role TO 'patient'@'localhost';

-- NOTE:
-- The data used in this script is fictional and created for educational purposes only.
-- No real patient or clinical data is included.

-- 1. CLINICS

INSERT INTO Clinics (ClinicName, ClinicAddress, PhoneNumber, Email) VALUES 

('Harley Street Clinic', '12 Harley St, London', 2071110001, 'info@harleyst.co.uk'),

('Westminster Medical', '50 Victoria St, London', 2072220002, 'info@westminster.co.uk'),

('City Health Hub', '100 Bishopsgate, London', 2073330003, 'info@cityhealth.co.uk');
 
-- 2. MEDICATIONS

INSERT INTO Medications (MedicationName, Descritption) VALUES 

('Paracetamol', 'Analgesic'), ('Amoxicillin', 'Antibiotic'), ('Ibuprofen', 'NSAID'),

('Amlodipine', 'Blood Pressure'), ('Metformin', 'Diabetes'), ('Salbutamol', 'Inhaler'),

('Lisinopril', 'Blood Pressure'), ('Atorvastatin', 'Cholesterol'), ('Omeprazole', 'Acid Reflux'),

('Cetirizine', 'Antihistamine');
 
-- 3. PATIENTS

INSERT INTO Patients (PatientName, PatientSurname, PhoneNumber, Email, NHSnumber, DateBirth) VALUES

('John', 'Doe', 7400100001, 'john@email.com', 1001, '1990-01-10'),

('Jane', 'Smith', 7400100002, 'jane@email.com', 1002, '1990-02-20'),

('Mark', 'Brown', 7400100003, 'mark@email.com', 1003, '1995-03-15'),

('Anna', 'White', 7400100004, 'anna@email.com', 1004, '1995-04-25'),

('Luca', 'Rossi', 7400100005, 'luca@email.com', 1005, '1980-05-30'),

('Sara', 'Verdi', 7400100006, 'sara@email.com', 1006, '1980-06-05'),

('Robert', 'Moore', 7400100007, 'robert@email.com', 1007, '1983-07-12'),

('Laura', 'Taylor', 7400100008, 'laura@email.com', 1008, '1983-08-18'),

('James', 'Anderson', 7400100009, 'james@email.com', 1009, '1975-09-22'),

('Olivia', 'Thomas', 7400100010, 'olivia@email.com', 1010, '1975-10-01'),

('Daniel', 'Jackson', 7400100011, 'daniel@email.com', 1011, '1991-11-14'),

('Sophia', 'White', 7400100012, 'sophia@email.com', 1012, '1991-12-25'),

('Joseph', 'Harris', 7400100013, 'joseph@email.com', 1013, '1993-01-08'),

('Ava', 'Martin', 7400100014, 'ava@email.com', 1014, '1993-02-19'),

('Thomas', 'Thompson', 7400100015, 'thomas@email.com', 1015, '1996-03-27'),

('Mia', 'Garcia', 7400100016, 'mia@email.com', 1016, '1996-04-03'),

('Charles', 'Martinez', 7400100017, 'charles@email.com', 1017, '1994-05-12'),

('Charlotte', 'Robinson', 7400100018, 'charlotte@email.com', 1018, '1994-06-21'),

('Christopher', 'Clark', 7400100019, 'chris@email.com', 1019, '1972-07-07'),

('Amelia', 'Rodriguez', 7400100020, 'amelia@email.com', 1020, '1997-08-30');
 
-- 4. DOCTORS

INSERT INTO Doctors (ClinicID, DoctorName, DoctorSurname, Speciality, Email, PhoneNumber, DateBirth) VALUES

(1, 'John', 'Smith', 'Cardiologist', 'jsmith1@clinic.co.uk', 7700900001, '1975-05-15'),

(1, 'Alice', 'Smith', 'Cardiologist', 'asmith@clinic.co.uk', 7700900002, '1982-08-20'),

(1, 'Sarah', 'Derm', 'Dermatologist', 'sderm@clinic.co.uk', 7700900003, '1970-12-01'),

(2, 'Emily', 'Brown', 'Pediatrician', 'ebrown@clinic.co.uk', 7700900004, '1985-03-10'),

(2, 'Michael', 'Brown', 'Dermatologist', 'mbrown@clinic.co.uk', 7700900005, '1968-07-22'),

(2, 'David', 'Wilson', 'Pediatrician', 'dwilson@clinic.co.uk', 7700900006, '1980-11-30'),

(3, 'Robert', 'Taylor', 'Neurologist', 'rtaylor@clinic.co.uk', 7700900007, '1978-01-14'),

(3, 'Laura', 'Taylor', 'Neurologist', 'ltaylor@clinic.co.uk', 7700900008, '1983-09-05'),

(3, 'James', 'Anderson', 'Orthopedist', 'janderson@clinic.co.uk', 7700900009, '1972-04-18');
 
-- 5. APPOINTMENTS

INSERT INTO Appointments (AppointmentDate, AppointmentTime, ClinicID, PatientID, DoctorID, Diagnosis, Status) VALUES

('2026-06-25', '09:00:00', 1, 1, 1, 'Hypertension', 'Completed'),

('2026-06-26', '10:30:00', 1, 2, 2, 'Dermatitis', 'Completed'),

('2026-06-29', '14:00:00', 2, 3, 4, 'Flu', 'Scheduled'),

('2026-06-30', '16:00:00', 2, 4, 4, 'Check-up', 'Scheduled'),

('2026-07-01', '11:00:00', 3, 5, 7, 'Migraine', 'Completed'),

('2026-07-02', '09:00:00', 3, 6, 7, 'Stress', 'Scheduled'),

('2026-07-03', '15:00:00', 1, 7, 1, 'Follow-up', 'Completed'),

('2026-07-06', '10:00:00', 2, 8, 6, 'Growth check', 'Scheduled'),

('2026-07-07', '14:00:00', 3, 9, 9, 'Knee pain', 'Scheduled'),

('2026-07-08', '09:30:00', 1, 10, 3, 'Rash', 'Scheduled'),

('2026-07-09', '11:00:00', 2, 11, 5, 'Eczema', 'Scheduled'),

('2026-07-10', '13:00:00', 3, 12, 8, 'Vision test', 'Scheduled'),

('2026-07-13', '08:30:00', 1, 13, 1, 'Routine', 'Scheduled'),

('2026-07-14', '15:30:00', 2, 14, 6, 'Flu', 'Scheduled'),

('2026-07-15', '16:00:00', 3, 15, 9, 'Pain', 'Scheduled');
 
-- 6. PRESCRIPTIONS

INSERT INTO Prescriptions (AppointmentID, MedicationID, Dosage, DateIssued, PatientID, DoctorID) VALUES

(1, 1, '500mg daily', '2026-06-25', 1, 1),

(2, 2, 'Twice daily', '2026-06-26', 2, 2),

(5, 5, 'Before bed', '2026-07-01', 5, 7),

(6, 5, 'Before bed', '2026-07-02', 6, 7),

(7, 1, 'As needed', '2026-07-03', 7, 1),

(NULL, 10, 'Once daily', '2026-07-05', 8, NULL),

(NULL, 3, 'Take with food', '2026-07-06', 9, NULL),

(NULL, 4, 'Once daily', '2026-07-07', 10, NULL),

(NULL, 6, 'Use at night', '2026-07-08', 11, NULL),

(NULL, 7, 'Twice daily', '2026-07-09', 12, NULL),

(NULL, 8, 'Once daily', '2026-07-10', 13, NULL),

(NULL, 9, 'Before meals', '2026-07-13', 14, NULL),

(NULL, 2, 'Finish course', '2026-07-14', 15, NULL),

(NULL, 5, 'As needed', '2026-07-15', 16, NULL),

(NULL, 1, '500mg', '2026-07-16', 17, NULL);
 
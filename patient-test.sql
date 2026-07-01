-- 1. Create a real login account for John Doe
CREATE USER 'jdoe_patient'@'localhost' IDENTIFIED BY 'JohnPass2026!';

-- 2. Assign him your custom patient role
GRANT 'patient_role' TO 'jdoe_patient'@'localhost';

-- 3. Make the role activate automatically when he logs in
ALTER USER 'jdoe_patient'@'localhost' DEFAULT ROLE 'patient_role';
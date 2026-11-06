-- Show details of all medical departments of hospital.
SELECT *
FROM department;
 
-- Find the contact details of patient “John Bob” whose patient ID is 5612.
SELECT patFirstName, patLastName, patPhoneNumber, emailAddress, homeAddress
FROM patient
WHERE patId = 5612;
 
-- Update the patient ID number 3456 contact details.
UPDATE patient
SET patPhoneNumber = '02-8763333', emailAddress = 'laura.g.new@email.com'
WHERE patId = 3456;
 
-- Schedule a new medical appointment.
INSERT INTO appointment (appId, appDate, appTime, patId, treatId)
VALUES (11, '2025-12-30', '16:30:00', 7192, 61);
 
-- Find details of all patients who have Diabetes.
SELECT p.patId, p.patFirstName, p.patLastName, mi.medicalConditions
FROM patient p
JOIN medical_information mi ON p.patId = mi.patId
WHERE mi.medicalConditions LIKE '%Diabetes%';
 
-- Display the first name and surname of all patients who are under the care of Dr. Kavin Smith.
SELECT DISTINCT p.patFirstName, p.patLastName
FROM patient p
JOIN appointment a ON p.patId = a.patId
JOIN appointment_has_staff ahs ON a.appId = ahs.appId
JOIN staff s ON ahs.staffId = s.staffId
WHERE s.staffFirstName = 'Kavin' AND s.staffLastName = 'Smith';
 
-- Change all patients in Orthopaedics department to Orthopaedic Surgery department.
SET FOREIGN_KEY_CHECKS = 0;
UPDATE department_has_treatment
SET deptId = 3
WHERE deptId = 2;
SET FOREIGN_KEY_CHECKS = 1;
 
-- Display the first name, surname, and hire date of all doctors sorted in descending order by hire date.
SELECT staffFirstName, staffLastName, hireDate
FROM staff
WHERE drStatus = 1
ORDER BY hireDate DESC;
 
-- Count how many patients are undergoing 'Heart Surgery' treatment.
SELECT COUNT(DISTINCT p.patId) AS patientsUndergoingHeartSurgery
FROM patient p
JOIN appointment a ON p.patId = a.patId
JOIN treatment t ON a.treatId = t.treatId
WHERE t.treatName = 'Heart Surgery' AND t.treatStatus = 'undergoing';
 
-- Add one new record to each table.
INSERT INTO department (deptId, deptName, location, deptPhoneNumber) VALUES
(12, 'Physiotherapy', 'Block B, Level 3', '01-7650012');
INSERT INTO treatment (treatId, treatName, treatStatus) VALUES
(101, 'Rehabilitation Session', 'upcoming');
INSERT INTO staff (staffId, staffFirstName, staffLastName, jobTitle, hireDate, daysOfWork, drStatus) VALUES
(12, 'Eleanor', 'Davies', 'Physiotherapist', '2024-05-15', 210, 0);
INSERT INTO patient (patId, patFirstName, patLastName, patPhoneNumber, emailAddress, homeAddress) VALUES
(9900, 'Oliver', 'Taylor', '02-8760011', 'oliver.t@email.com', '7 Grand Canal Dock, Dublin');
INSERT INTO medical_information (patId, birthDate, bloodType, height, weight, allergies, pregnancyStatus, medications, medicalConditions) VALUES
(9900, '1995-12-05', 'A+', 1.85, 90.0, 'Dust', 0, 'None', 'Knee Injury History');
INSERT INTO appointment (appId, appDate, appTime, patId, treatId) VALUES
(12, '2025-11-20', '11:00:00', 9900, 101);
INSERT INTO department_has_treatment (deptId, treatId) VALUES
(12, 101);
INSERT INTO department_has_staff (deptId, staffId) VALUES
(12, 12);
INSERT INTO appointment_has_staff (appId, staffId) VALUES
(12, 12);
 
-- Delete one record from all tables.
DELETE FROM appointment_has_staff
WHERE appId = 12 AND staffId = 12;
DELETE FROM department_has_staff
WHERE deptId = 12 AND staffId = 12;
DELETE FROM department_has_treatment
WHERE deptId = 12 AND treatId = 101;
DELETE FROM medical_information
WHERE patId = 9900;
DELETE FROM appointment
WHERE appId = 12;
DELETE FROM patient
WHERE patId = 9900;
DELETE FROM treatment
WHERE treatId = 101;
DELETE FROM staff
WHERE staffId = 12;
DELETE FROM department
WHERE deptId = 12;
 
-- Find the total number of days off for all staff, order this by least days off.
SELECT staffFirstName, staffLastName, (365 - daysOfWork) AS totalDaysOff
FROM staff
ORDER BY TotalDaysOff ASC;

-- Change the role of all staff who have a job title 'Office Worker' to 'Administrator'.
UPDATE staff
SET jobTitle = 'Administrator'
WHERE jobTitle = 'Office Worker';

-- Set the Orthopaedic Surgery department phone number to be 01-7654321.
UPDATE department
SET deptPhoneNumber = '01-7654321'
WHERE deptName = 'Orthopaedic Surgery';

-- Set the chief executive officer (CEO) of the hospital to be called Michael Dean.
UPDATE staff
SET staffFirstName = 'Michael', staffLastName = 'Dean'
WHERE jobTitle = 'CEO';
 
-- Show all staff members who have been working there for longer than 3 years. 
SELECT staffFirstName, staffLastName, jobTitle, hireDate, FLOOR(DATEDIFF(CURDATE(), hireDate) / 365) AS yearsWorked
FROM staff
WHERE FLOOR(DATEDIFF(CURDATE(), hireDate) / 365) > 3;
 
-- Show the detail of all patient names, medical history, appointment dates, times, and treatment.
SELECT p.patFirstName, p.patLastName, mi.allergies, mi.medicalConditions, a.appDate, a.appTime, t.treatName, t.treatStatus
FROM patient p
JOIN medical_information mi ON p.patId = mi.patId
JOIN appointment a ON p.patId = a.patId
JOIN treatment t ON a.treatId = t.treatId
ORDER BY p.patLastName, a.appDate;
 
-- Identify how many patients have the word 'road' in their address.
SELECT COUNT(patId) AS PatientsWithRoadInAddress
FROM patient
WHERE homeAddress LIKE '%Road%';
 
-- Create a view that will show the result of a query drawing information from three tables at once.
DROP VIEW IF EXISTS staff_patient_treatment_view;
CREATE VIEW staff_patient_treatment_view
AS
SELECT s.staffFirstName, s.staffLastName, p.patFirstName, p.patLastName, a.appDate, t.treatName
FROM staff s
JOIN appointment_has_staff ahs ON s.staffId = ahs.staffId
JOIN appointment a ON ahs.appId = a.appId
JOIN patient p ON a.patId = p.patId
JOIN treatment t ON a.treatId = t.treatId;
 
-- Drop all information contained in the appointments relation.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE appointment;
SET FOREIGN_KEY_CHECKS = 1;

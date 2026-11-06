SET FOREIGN_KEY_CHECKS = 0;

USE hospital_project;

DROP TABLE IF EXISTS appointment_has_staff;
DROP TABLE IF EXISTS department_has_staff;
DROP TABLE IF EXISTS department_has_treatment;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS medical_information;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS treatment;
DROP TABLE IF EXISTS department;

CREATE TABLE department (
    deptId INT PRIMARY KEY,
    deptName VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL,
    deptPhoneNumber VARCHAR(20)
);

CREATE TABLE treatment (
    treatId INT PRIMARY KEY,
    treatName VARCHAR(100) NOT NULL,
    treatStatus VARCHAR(20) NOT NULL
);

CREATE TABLE staff (
    staffId INT PRIMARY KEY,
    staffFirstName VARCHAR(50) NOT NULL,
    staffLastName VARCHAR(50) NOT NULL,
    jobTitle VARCHAR(50),
    hireDate DATE,
    daysOfWork INT,
    drStatus TINYINT
);

CREATE TABLE patient (
    patId INT PRIMARY KEY,
    patFirstName VARCHAR(50) NOT NULL,
    patLastName VARCHAR(50) NOT NULL,
    patPhoneNumber VARCHAR(20),
    emailAddress VARCHAR(255),
    homeAddress VARCHAR(255)
);

CREATE TABLE medical_information (
    patId INT PRIMARY KEY,
    birthDate DATE,
    bloodType VARCHAR(5),
    height DECIMAL(3,2),
    weight DECIMAL(4,1),
    allergies TEXT,
    pregnancyStatus TINYINT,
    medications TEXT,
    medicalConditions TEXT,
    FOREIGN KEY (patId) REFERENCES patient(patId)
);

CREATE TABLE appointment (
    appId INT PRIMARY KEY,
    appDate DATE NOT NULL,
    appTime TIME NOT NULL,
    patId INT NOT NULL,
    treatId INT NOT NULL,
    FOREIGN KEY (patId) REFERENCES patient(patId),
    FOREIGN KEY (treatId) REFERENCES treatment(treatId)
);

CREATE TABLE department_has_treatment (
    deptId INT,
    treatId INT,
    PRIMARY KEY (deptId, treatId),
    FOREIGN KEY (deptId) REFERENCES department(deptId),
    FOREIGN KEY (treatId) REFERENCES treatment(treatId)
);

CREATE TABLE department_has_staff (
    deptId INT,
    staffId INT,
    PRIMARY KEY (deptId, staffId),
    FOREIGN KEY (deptId) REFERENCES department(deptId),
    FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

CREATE TABLE appointment_has_staff (
    appId INT,
    staffId INT,
    PRIMARY KEY (appId, staffId),
    FOREIGN KEY (appId) REFERENCES appointment(appId),
    FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

INSERT INTO department (deptId, deptName, location, deptPhoneNumber) VALUES
(1, 'Cardiology', 'Block A, Level 1', '01-7650001'),
(2, 'Orthopaedics', 'Block A, Level 2', '01-7650002'),
(3, 'Orthopaedic Surgery', 'Block A, Level 3', '01-7650003'),
(4, 'Paediatrics', 'Block A, Level 4', '01-7650004'),
(5, 'General Services', 'Block B, Level 1', '01-7650005'),
(6, 'Neurology', 'Block B, Level 2', '01-7650006'),
(7, 'Radiology', 'Block C, Level 2', '01-7650007'),
(8, 'Pathology', 'Block C, Level 3', '01-7650008'),
(9, 'Pharmacy', 'Block D, Level 1', '01-7650009'),
(10, 'Intensive Care', 'Block D, Level 2', '01-7650010'),
(11, 'Emergency', 'Ground Floor', '01-7650011');

INSERT INTO treatment (treatId, treatName, treatStatus) VALUES
(1, 'Heart Surgery', 'upcoming'), (2, 'Heart Surgery', 'undergoing'), (3, 'Heart Surgery', 'completed'), (4, 'Heart Surgery', 'cancelled'),
(11, 'Knee Replacement', 'upcoming'), (12, 'Knee Replacement', 'undergoing'), (13, 'Knee Replacement', 'completed'), (14, 'Knee Replacement', 'cancelled'),
(21, 'Routine Vaccination', 'upcoming'), (22, 'Routine Vaccination', 'undergoing'), (23, 'Routine Vaccination', 'completed'), (24, 'Routine Vaccination', 'cancelled'),
(31, 'Diagnostic Imaging', 'upcoming'), (32, 'Diagnostic Imaging', 'undergoing'), (33, 'Diagnostic Imaging', 'completed'), (34, 'Diagnostic Imaging', 'cancelled'),
(41, 'Spinal Tap Procedure', 'upcoming'), (42, 'Spinal Tap Procedure', 'undergoing'), (43, 'Spinal Tap Procedure', 'completed'), (44, 'Spinal Tap Procedure', 'cancelled'),
(51, 'MRI Scan', 'upcoming'), (52, 'MRI Scan', 'undergoing'), (53, 'MRI Scan', 'completed'), (54, 'MRI Scan', 'cancelled'),
(61, 'Biopsy Analysis', 'upcoming'), (62, 'Biopsy Analysis', 'undergoing'), (63, 'Biopsy Analysis', 'completed'), (64, 'Biopsy Analysis', 'cancelled'),
(71, 'Medication Dispensing', 'upcoming'), (72, 'Medication Dispensing', 'undergoing'), (73, 'Medication Dispensing', 'completed'), (74, 'Medication Dispensing', 'cancelled'),
(81, 'Mechanical Ventilation', 'upcoming'), (82, 'Mechanical Ventilation', 'undergoing'), (83, 'Mechanical Ventilation', 'completed'), (84, 'Mechanical Ventilation', 'cancelled'),
(91, 'Trauma Stabilization', 'upcoming'), (92, 'Trauma Stabilization', 'undergoing'), (93, 'Trauma Stabilization', 'completed'), (94, 'Trauma Stabilization', 'cancelled');

INSERT INTO staff (staffId, staffFirstName, staffLastName, jobTitle, hireDate, daysOfWork, drStatus) VALUES
(1, 'Robert', 'Downs', 'CEO', '2010-01-01', 200, 0),
(2, 'Kavin', 'Smith', 'Cardiologist', '2015-05-20', 240, 1),
(3, 'Serena', 'Khan', 'Orthopaedic Surgeon', '2018-01-15', 235, 1),
(4, 'Jasmine', 'Lee', 'Senior Paediatric Nurse', '2020-11-01', 250, 0),
(5, 'Marcus', 'Wright', 'Office Worker', '2017-03-10', 260, 1),
(6, 'Olivia', 'Chen', 'Neurophysiologist', '2019-07-25', 245, 0),
(7, 'Rohan', 'Patel', 'MRI Technologist', '2016-09-01', 220, 0),
(8, 'Amelia', 'Scott', 'Laboratory Scientist', '2014-04-05', 230, 0),
(9, 'Ben', 'Carter', 'Hospital Pharmacist', '2021-02-14', 240, 0),
(10, 'Chloe', 'Hayes', 'ICU Lead Clinician', '2022-08-01', 255, 1),
(11, 'David', 'Evans', 'Emergency Medicine Ragistrar', '2023-01-20', 260, 1);

INSERT INTO patient (patId, patFirstName, patLastName, patPhoneNumber, emailAddress, homeAddress) VALUES
(1298, 'Alice', 'Smith', '02-8760001', 'alice.s@email.com', '1 High Street, London'),
(2632, 'Robert', 'Jones', '02-8760002', 'robert.j@email.com', '15 Oak Lane, Birmingham'),
(3456, 'Laura', 'Gomez', '02-8760003', 'laura.g@email.com', '42 Elm Road, Manchester'),
(4127, 'Michael', 'Brown', '02-8760004', 'michael.b@email.com', '8 The Avenue, Bristol'),
(5612, 'John', 'Bob', '02-876005', 'john.b@email.com', '12 Old Town, Belfast'),
(6121, 'Sarah', 'Wilson', '02-8760006', 'sarah.w@email.com', '29 Park Row, Leeds'),
(7192, 'James', 'Miller', '02-8760007', 'james.m@email.com', '6 Willow Crescent, Edinburgh'),
(8120, 'Emily', 'Clark', '02-8760008', 'emily.c@email.com', '10 Forest View, Glasgow'),
(9310, 'Daniel', 'Walker', '02-8760009', 'daniel.w@email.com', '33 River Lane, Dublin'),
(1247, 'Jessica', 'Hall', '02-8760010', 'jessica.h@email.com', '5 New Road, Cardiff');

INSERT INTO medical_information (patId, birthDate, bloodType, height, weight, allergies, pregnancyStatus, medications, medicalConditions) VALUES
(1298, '1985-06-15', 'O+', 1.68, 65.2, 'Penicillin', 0, 'Metoprolol', 'Hypertension'),
(2632, '1972-11-20', 'A-', 1.80, 88.5, 'None', 0, 'Aspirin', 'Osteoarthritis'),
(3456, '2019-03-01', 'B+', 0.95, 14.7, 'Dairy', 1, 'Vitamins', 'Asthma'),
(4127, '1999-09-09', 'AB+', 1.75, 75.0, 'Pollen', 0, 'None', 'Diabetes'),
(5612, '1980-12-30', 'AB-', 1.78, 84.0, 'Pollen', 0, 'Ibuprofen', 'Mild Arthritis'),
(6121, '1995-04-12', 'O-', 1.70, 71.3, 'Nuts', 0, 'Vitamins', 'Asthma'),
(7192, '1965-01-28', 'A+', 1.90, 95.9, 'Latex', 0, 'Statins', 'High Cholesterol, Diabetes'),
(8120, '1988-10-05', 'B-', 1.63, 62.1, 'None', 0, 'Sertraline', 'Migraines'),
(9310, '1990-07-07', 'O+', 1.82, 80.4, 'Shellfish', 0, 'None', 'Concussion History'),
(1247, '2005-02-22', 'A-', 1.55, 55.6, 'Cats', 0, 'None', 'Anxiety, Diabetes');

INSERT INTO appointment (appId, appDate, appTime, patId, treatId) VALUES
(1, '2025-10-10', '10:00:00', 1298, 2),
(2, '2025-09-05', '14:30:00', 2632, 11),
(3, '2025-09-15', '09:00:00', 3456, 22),
(4, '2025-12-01', '19:45:00', 4127, 34),
(5, '2025-12-20', '11:30:00', 5612, 43),
(6, '2025-12-25', '16:00:00', 6121, 52),
(7, '2025-08-10', '08:30:00', 7192, 63),
(8, '2025-09-01', '13:00:00', 8120, 71),
(9, '2025-10-05', '10:30:00', 9310, 84),
(10, '2025-12-02', '20:30:00', 1247, 91);

INSERT INTO department_has_treatment (deptId, treatId) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 11), (2, 12), (2, 13), (2, 14),
(4, 21), (4, 22), (4, 23), (4, 24),
(5, 31), (5, 32), (5, 33), (5, 34),
(6, 41), (6, 42), (6, 43), (6, 44),
(7, 51), (7, 52), (7, 53), (7, 54),
(8, 61), (8, 62), (8, 63), (8, 64),
(9, 71), (9, 72), (9, 73), (9, 74),
(10, 81), (10, 82), (10, 83), (10, 84),
(11, 91), (11, 92), (11, 93), (11, 94);

INSERT INTO department_has_staff (deptId, staffId) VALUES
(1, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11);

INSERT INTO appointment_has_staff (appId, staffId) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11);

SET FOREIGN_KEY_CHECKS = 1;
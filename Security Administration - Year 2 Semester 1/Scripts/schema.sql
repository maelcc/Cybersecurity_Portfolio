CREATE TABLE staff_directory (
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    email NVARCHAR(100) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL, 
    full_name NVARCHAR(100) NOT NULL,
    role NVARCHAR(50) NOT NULL, -- Roles: Developer, QA, PM
    last_login DATETIME DEFAULT GETDATE()
);

-- Bcrypt hash for the plain text password 'Pass1234'
DECLARE @HASH NVARCHAR(255) = '$2b$12$Z08Ds5GGsEZwR50Vy/DTme53mESSibQU.dHmUWFqvte77ybE5KpUq';

INSERT INTO staff_directory (email, password_hash, full_name, role)
VALUES 
-- Team 1: Developers
('liam.dev@techstart.com', @HASH, 'Liam O''Connor', 'Developer'),
('sophie.dev@techstart.com', @HASH, 'Sophie Byrne', 'Developer'),

-- Team 2: QA Testers
('noah.qa@techstart.com', @HASH, 'Noah Murphy', 'QA Tester'),
('emma.qa@techstart.com', @HASH, 'Emma Walsh', 'QA Tester'),

-- Team 3: Project Managers
('jack.pm@techstart.com', @HASH, 'Jack Kelly', 'Project Manager'),
('ava.pm@techstart.com', @HASH, 'Ava Ryan', 'Project Manager');
GO



CREATE TABLE project_list (
    project_id INT PRIMARY KEY IDENTITY(100,1),
    project_name NVARCHAR(150) NOT NULL,
    project_status NVARCHAR(50) NOT NULL,
    budget_usd DECIMAL(18, 2) NOT NULL,
    -- Foreign Key reference to the Project Manager (Jack or Ava)
    pm_staff_id INT FOREIGN KEY REFERENCES staff_directory(staff_id), 
    start_date DATE DEFAULT GETDATE()
);

INSERT INTO project_list (project_name, project_status, budget_usd, pm_staff_id)
VALUES
('Secure Login Module R4', 'Active', 15000.00, (SELECT staff_id FROM staff_directory WHERE full_name='Jack Kelly')),
('Azure Migr. Phase II', 'In Testing', 45000.00, (SELECT staff_id FROM staff_directory WHERE full_name='Ava Ryan')),
('Database Encryption Audit', 'On Hold', 5000.00, (SELECT staff_id FROM staff_directory WHERE full_name='Jack Kelly'));
GO
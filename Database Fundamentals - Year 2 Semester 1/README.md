# Hospital Management Database

A relational database for a fictional hospital, designed from scratch and implemented in MySQL. The project covers the full database lifecycle: entity identification, ERD modelling at conceptual, logical, and physical levels, normalisation to third normal form, implementation, population with sample data, and a set of example queries.

## Schema

The database contains 9 tables in third normal form:

- `department` - hospital departments and their locations
- `treatment` - treatments and their status (upcoming, undergoing, completed, cancelled)
- `staff` - staff members, their roles, hire dates, and doctor status
- `patient` - patients and their contact details
- `medical_information` - medical data linked one-to-one to each patient
- `appointment` - ties patients and treatments together
- `department_has_treatment` - junction table between departments and treatments
- `department_has_staff` - junction table between departments and staff
- `appointment_has_staff` - junction table between appointments and staff

## Example Queries

The project includes queries such as:

- Finding all patients with a given medical condition
- Listing patients under the care of a specific staff member
- Counting patients undergoing a specific treatment
- Updating contact details and moving records between departments
- Creating a view combining staff, patient, appointment, and treatment data

## Usage

Run the SQL script in MySQL Workbench or from the MySQL command line:

```
source hospital_project.sql
```

The script drops existing tables, creates the schema, and inserts the sample data.

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning. All data in the database is fictional.
# Project Details

## Purpose & Outcome

The purpose of this project was to design and implement a relational database for a hospital, from initial design through to a fully working, queryable database.

The project was split into three tasks. The first was database design: identifying the entities of a hospital system (departments, treatments, staff, patients, appointments, and medical information), defining their relationships, cardinalities, and constraints, and producing conceptual, logical, and physical ERDs as well as a relational model in third normal form. The second task was creating and populating the database in MySQL, with sample data for every table. The third task was querying the dataset with a wide range of SQL operations.

The outcome was a complete 9-table hospital database in third normal form, made up of 5 core entities and 4 junction tables to handle many-to-many relationships. It is populated with sample data and supports queries combining joins, updates, inserts, deletes, aggregate functions, and views.

## Technologies, Tools and Methods

- MySQL and MySQL Workbench
- SQL: data definition (CREATE TABLE, DROP), data manipulation (INSERT, UPDATE, DELETE, TRUNCATE), and views
- Entity-Relationship Diagram modelling at conceptual, logical, and physical levels
- Normalisation to third normal form (3NF)
- Primary keys, foreign keys, and composite primary keys on junction tables
- Many-to-many relationship handling through junction tables
- TINYINT used in place of boolean values (not supported by MySQL)
- Diagram tools: drawn on paper and modelled with an online diagram tool

## Individual Contribution

I completed the entire project by myself. I identified the entities and attributes, defined the relationships and cardinalities, and drew the conceptual, logical, and physical ERDs. I normalised the model to 3NF and made the design decisions, such as replacing the initial medical history entity with a medical information entity linked one-to-one to patient. I wrote all the SQL to create and populate the 9 tables, and I wrote and tested every query in the querying task, including the joins, updates, and the view drawing from three tables.
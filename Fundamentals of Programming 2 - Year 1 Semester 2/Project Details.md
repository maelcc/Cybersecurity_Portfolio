# Project Details

## Purpose & Outcome

The purpose of this project was to build a command-line budget tracker application in Python. The app lets the user manage transactions stored in a CSV file, with each transaction holding a date (day, month, year), a description, an amount, and a category (income or expense).

The app supports five core operations: adding a transaction with input validation, viewing all transactions, updating a transaction's amount, deleting a transaction, and searching for a transaction by description. All of it is driven through a text menu that loops until the user exits.

The outcome was a fully working application, split into a functions module, a main program, and a separate test suite. Every function is covered by unit tests using simulated user input, and all tests pass.

## Technologies, Tools and Methods

- Python
- The built-in csv module for reading and writing transaction data
- Command-line menu-driven interface
- Input validation for types and value ranges
- Unit testing with the unittest framework
- unittest.mock's patch to simulate user input during tests
- Assertions to verify function outputs
- Jupyter Notebook used to run and document the app

## Individual Contribution

I completed the entire project by myself. I wrote all five application functions (add, view, update, delete, search) with their validation logic, the main menu program, and the CSV file handling. I also wrote the full unit test suite, including the simulated input for each test, and verified that all tests pass.
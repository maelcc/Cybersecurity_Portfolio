# Budget Tracker

A command-line budget tracker application written in Python. It stores transactions in a CSV file and lets the user add, view, update, delete, and search them. Each transaction has a date (day, month, year), a description, an amount, and a category (income or expense).

## Features

- Add a transaction, with validation of input types and value ranges
- View all stored transactions
- Update a transaction's amount by its description
- Delete a transaction by its description
- Search for a transaction by its description
- Menu-driven interface that loops until the user chooses to exit

## Project Structure

- `budget_tracker.py` contains the application functions (add, view, update, delete, search) and the CSV handling
- `main.py` contains the menu program that calls the functions
- `test_budget_tracker.py` contains the unit tests for every function
- `transactions.csv` stores the transaction data

## Usage

Run the main program:

```
python3 main.py
```

## Testing

Run the test suite:

```
python3 tests/test_budget_tracker.py
```

All tests pass.

## Requirements

None. The project only uses Python built-in modules (csv, sys, unittest.mock).

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning.
import csv

def add():
  while True:
    try:
      day = int(input("Enter day (1-31): "))
      if 1 <= day <= 31:
        break
      else:
        print("Invalid day, try again.")
    except ValueError:
      print("Invalid day, try again.")
  while True:
    try:
      month = int(input("Enter month (1-12): "))
      if 1 <= month <= 12:
        break
      else:
        print("Invalid month, try again.")
    except ValueError:
      print("Invalid month, try again.")
  while True:
    try:
      year = int(input("Enter year: "))
      if 1950 <= year <= 2025:
        break
      else:
        print("Invalid year, try again.")
    except ValueError:
      print("Invalid year, try again.")
  description = input("Enter description: ")
  while True:
    try:
      amount = float(input("Enter amount: "))
      if amount >= 0:
        break
      else:
        print("Invalid amount, try again.")
    except ValueError:
      print("Invalid amount, try again.")
  while True:
    category = input("Enter category ('income' or 'expense'): ")
    if category == "income" or category == "expense":
      break
    else:
      print("Invalid category, try again.")
  file = open("transactions.csv", "a")
  writer = csv.writer(file)
  row = [f"{day}/{month}/{year}", description, amount, category]
  writer.writerow(row)
  file.close()
  print("Transaction added:", row)
  return row


def view():
  print("List of transactions:")
  file = open("transactions.csv", "r")
  content = csv.reader(file)
  rows = []
  for row in content:
    print(row)
    rows.append(row)
  file.close()
  return rows


def update():
  description = str(input("Search by description: "))
  exists = False
  new_rows = []
  file = open("transactions.csv", "r")
  content = csv.reader(file)
  for row in content:
    if row[1] == description:
      exists = True
      while True:
        try:
          amount = float(input("Enter amount: "))
          if amount >= 0:
            break
          else:
            print("Invalid amount, try again.")
        except ValueError:
          print("Invalid amount, try again.")
      row[2] = amount
      print("Transaction updated:", row)
    new_rows.append(row)
  file.close()
  if exists == False:
    print("No transaction was found by that description.")   
  else:
    file = open("transactions.csv", "w")
    writer = csv.writer(file)
    for row in new_rows:
      writer.writerow(row)
    file.close()
  return new_rows


def delete():
  description = str(input("Search by description: "))
  exists = False
  new_rows = []
  file = open("transactions.csv", "r")
  content = csv.reader(file)
  for row in content:
    if row[1] != description:
      new_rows.append(row)
    else:
      exists = True
      print("Transaction deleted:", row)
  file.close()
  if exists == False:
    print("No transaction was found by that description.")   
  else:
    file = open("transactions.csv", "w")
    writer = csv.writer(file)
    for row in new_rows:
      writer.writerow(row)
    file.close()
  return new_rows


def search():
  description = str(input("Search by description: "))
  file = open("transactions.csv", "r")
  content = csv.reader(file)
  exists = False
  for row in content:
    if row[1] == description:
      exists = True
      print("Transaction found:", row)
  file.close()
  if exists == False:
    print("No transaction was found by that description.")
  return row
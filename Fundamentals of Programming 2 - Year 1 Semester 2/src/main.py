import csv
from budget_tracker import add, view, update, delete, search

file = open("transactions.csv", "w")
writer = csv.writer(file)
writer.writerow(["Date", "Description", "Amount", "Category"])
file.close()

print("BUDGET TRACKER APP")

def main():
  while True:
    print("""
MENU:
Add - a
View - v
Update - u
Delete - d
Search - s
Exit - e
    """)
    action = str(input("Choose action: "))
    if action == "a":
      add()
    elif action == "v":
      view()
    elif action == "u":
      update()
    elif action == "d":
      delete()
    elif action == "s":
      search()
    elif action == "e":
      print("Exiting App..")
      break
    else:
      print("Invalid action, try again.")

if __name__ == '__main__':
  main()
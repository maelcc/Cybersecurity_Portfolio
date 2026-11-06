import sys
sys.path.append("/content/drive/MyDrive/Colab Notebooks/B00175970_Maël_ConejosCrusson/src")
import csv
from budget_tracker import add, view, update, delete, search
from unittest.mock import patch

file = open("transactions.csv", "w")
writer = csv.writer(file)
file.close()


def test_add():
  with patch("builtins.input", side_effect=[12, 2, 2025, "shop", 34.25, "expense"]):
    assert add() == ["12/2/2025", "shop", 34.25, "expense"]
  with patch("builtins.input", side_effect=[28, 1, 2025, "work", 120.30, "income"]):
    assert add() == ["28/1/2025", "work", 120.3, "income"]


def test_view():
  assert view() == [["12/2/2025", "shop", "34.25", "expense"], ["28/1/2025", "work", "120.3", "income"]]


def test_update():
  with patch("builtins.input", side_effect=["shop", 50.65]):
    assert update() == [["12/2/2025", "shop", 50.65, "expense"], ["28/1/2025", "work", "120.3", "income"]]


def test_delete():
  with patch("builtins.input", side_effect=["shop"]):
    assert delete() == [["28/1/2025", "work", "120.3", "income"]]


def test_search():
  with patch("builtins.input", side_effect=["work"]):
    assert search() == ["28/1/2025", "work", "120.3", "income"]


if __name__ == '__main__':
  test_add()
  test_view()
  test_update()
  test_delete()
  test_search()
  print("-----------------")
  print("All tests passed.")
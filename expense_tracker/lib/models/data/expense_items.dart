import 'package:expense_tracker/models/expense.dart';

List<Expense> expenses = [
  Expense(
    title: "Gaming",
    date: DateTime.now(),
    amount: 11,
    category: Category.leisure,
  ),
  Expense(
    title: "Rice",
    date: DateTime.now(),
    amount: 20,
    category: Category.food,
  ),
  Expense(
    title: "Beans",
    date: DateTime.now(),
    amount: 19,
    category: Category.food,
  ),
  Expense(
    title: "Tennis",
    date: DateTime.now(),
    amount: 30,
    category: Category.leisure,
  ),
];

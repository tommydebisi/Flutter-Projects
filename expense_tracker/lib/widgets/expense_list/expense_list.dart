import 'package:expense_tracker/models/data/expense_items.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onDismissed;

  @override
  Widget build(BuildContext context) {
    // put the
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        // unique identifier for item in list
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDismissed(expenses[index]);
        },
        child: ExpenseItem(expenseItem: expenses[index]),
      ),
    );
  }
}

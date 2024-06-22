import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseItem});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(expenseItem.title),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('\$${expenseItem.amount.toStringAsFixed(2)}'),
                // automatically takes up the whole space
                const Spacer(),
                Icon(categoryIcons[expenseItem.category]),
                const SizedBox(
                  width: 10,
                ),
                Text(expenseItem.formatDate)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

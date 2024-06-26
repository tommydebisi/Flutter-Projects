import 'package:expense_tracker/models/data/expense_items.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenseItems = expenses;

  void _addExpense(Expense item) {
    setState(() {
      expenses.add(item);
    });
  }

  void _getExpense() {
    // add pop up from the bottom
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: _addExpense,
      ),
    );
  }

  // remove expense
  void _removeExpense(Expense expense) {
    // get the index of expense
    final expenseIndex = _expenseItems.indexOf(expense);

    setState(() {
      _expenseItems.remove(expense);
    });

    // clear existing snackar before showing next snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    // show snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              _expenseItems.insert(expenseIndex, expense);
            });
          }),
      content: const Text("Expense removed."),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Start adding your expense...'),
    );

    if (_expenseItems.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _expenseItems,
        onDismissed: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _getExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}

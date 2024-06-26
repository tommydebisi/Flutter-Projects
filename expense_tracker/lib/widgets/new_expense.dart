import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense item) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _datePicker() async {
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 2, dateNow.month, dateNow.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: firstDate,
      lastDate: dateNow,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _expenseSaver() {
    final amountConvert = double.tryParse(_amountController.text.trim());
    final title = _titleController.text.trim();
    if (title.isEmpty ||
        amountConvert == null ||
        amountConvert <= 0 ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category was entered',
          ),
          actions: [
            TextButton(
              onPressed: () {
                // close the current context
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );

      return;
    }

    // save and display the expense added to the main screen
    final newExpense = Expense(
      amount: amountConvert,
      title: title,
      category: _selectedCategory,
      date: _selectedDate!,
    );

    // save the expense
    widget.addExpense(newExpense);

    // close modal bottom
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // needed to dispose to free space occupied in memory
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No selected Date'
                          : dateFormatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              // add a drop down menu
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (category) {
                    // check if category is null
                    if (category == null) return;

                    setState(() {
                      _selectedCategory = category;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _expenseSaver,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

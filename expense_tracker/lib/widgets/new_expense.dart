import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense) addExpense;
  const NewExpense({super.key, required this.addExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _enteredTitle = TextEditingController();
  final _enteredAmount = TextEditingController();
  DateTime? _selectedDate;
  Category _pickedcategory = Category.work;

  void _DatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  get formateddate =>
      "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";

  @override
  void dispose() {
    _enteredTitle.dispose();
    _enteredAmount.dispose();
    super.dispose();
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(_enteredAmount.text);
    final isInvalideAmount = (enteredAmount == null) || enteredAmount <= 0;

    if (_enteredTitle.text.trim().isEmpty ||
        isInvalideAmount == true ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                'Please make sure a valid title, amount, date and category was entered. ',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text("Okay"),
                ),
              ],
            ),
      );
      return;
    } else {
      final newExpense = Expense(
        title: _enteredTitle.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _pickedcategory,
      );
      widget.addExpense(newExpense);
      Navigator.pop(context);
    }
  }

  // var _enteredTitle= '';

  // _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _enteredTitle,
            maxLength: 50,
            decoration: InputDecoration(labelText: "Title"),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                // Wrap TextField in Expanded to give it a constrained width
                child: TextField(
                  controller: _enteredAmount,
                  decoration: InputDecoration(
                    prefixText: "DZD ",
                    labelText: "Amount",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(
                width: 16,
              ), // Add some spacing between amount field and date display

              Row(
                children: [
                  Text(
                    _selectedDate == null ? "No selected Date" : formateddate,
                  ),
                  IconButton(
                    onPressed: _DatePicker,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              DropdownButton(
                value: _pickedcategory,
                items:
                    Category.values
                        .map(
                          (categoryelement) => DropdownMenuItem(
                            value: categoryelement,
                            child: Text(categoryelement.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _pickedcategory = value;
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () => {Navigator.pop(context)},
                child: Text("Cancel"),
              ),

              ElevatedButton(
                onPressed: submitExpenseData,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

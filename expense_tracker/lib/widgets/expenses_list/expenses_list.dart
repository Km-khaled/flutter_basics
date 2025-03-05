import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense) removeExpense;
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: Theme.of(context).cardTheme.margin,
            ),

            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index]),
          ),
    );
  }
}

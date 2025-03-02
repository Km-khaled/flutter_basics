import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});
  @override
  Widget build(context) {
    return Card(                                                                                                             
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 5),
            Row(
              children: [
                Text("DZD ${expense.amount.toStringAsFixed(2)}"),
                Spacer(),
                Icon(categoryIcons[expense.category]),
                                  SizedBox(width: 8),
                                  Text(expense.formateddate)
              ],
            ),

          ],
        ),
      ),
    );
  }
}

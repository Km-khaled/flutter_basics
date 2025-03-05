import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  get formateddate => "${date.day}/${date.month}/${date.year}";
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpnses, this.category)
    : expenses =
          allExpnses.where((expense) => expense.category == category).toList();

  const ExpenseBucket({required this.category, required this.expenses});

  double get totalExpenses {
    double sum = 0.0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType {
  food(iconData: Icons.food_bank_outlined),
  travel(iconData: Icons.run_circle_outlined),
  lersure(iconData: Icons.chair),
  work(iconData: Icons.work);

  const ExpenseType({required this.iconData});

  final IconData iconData;
}

class Expense {
  String id;
  final String title;
  final double amount;
  final DateTime date;
  ExpenseType expenseType;
  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
    ExpenseType? typeofExpense,
  }) : id = id ?? Uuid().v4(),
       expenseType = typeofExpense ?? ExpenseType.lersure;
}

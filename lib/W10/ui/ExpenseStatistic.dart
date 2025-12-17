import 'package:flutter/material.dart';
import '../model/Expense.dart';

class ExpenseStatistic extends StatelessWidget {
  const ExpenseStatistic({super.key, required this.allExpenses});
  final List<Expense> allExpenses;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ExpenseCard(categories: ExpenseType.food, allExpenses: allExpenses),

          ExpenseCard(
            categories: ExpenseType.lersure,
            allExpenses: allExpenses,
          ),

          ExpenseCard(categories: ExpenseType.work, allExpenses: allExpenses),

          ExpenseCard(categories: ExpenseType.travel, allExpenses: allExpenses),
        ],
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.categories,
    required this.allExpenses,
  });

  final ExpenseType categories;
  final List<Expense> allExpenses;

  int calcTotal(ExpenseType type) {
    double total = 0;
    for (var expense in allExpenses) {
      if (expense.expenseType == type) {
        total += expense.amount;
      }
    }
    return total.round();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${calcTotal(categories)}\$",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Icon(categories.iconData, size: 40),
      ],
    );
  }
}

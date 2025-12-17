import 'package:flutter/material.dart';
import '../model/Expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });
  final List<Expense> expenses;
  final Function(int index, DismissDirection direction) removeExpense;

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? Center(
            child: Text(
              "No expenses found",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final String expense = expenses[index].id;

              return Dismissible(
                key: Key(expense),
                onDismissed: (direction) {
                  removeExpense(index, direction);
                },
                background: Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.delete_forever_outlined),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhysicalModel(
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          expenses[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "\$${expenses[index].amount}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10,
                          children: [
                            Icon(expenses[index].expenseType.iconData),

                            Text(
                              expenses[index].date.toString().split(" ")[0],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

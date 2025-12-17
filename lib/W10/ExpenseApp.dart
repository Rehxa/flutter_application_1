import 'package:flutter/material.dart';
import 'data/Expense_data.dart';
import 'ui/ExpenseSheet.dart';
import 'model/Expense.dart';
import 'ui/ExpenseStatistic.dart';
import 'ui/ExpenseList.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  void onSave(BuildContext context) async {
    Expense? newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (e) => Center(child: ExpenseSheet()),
    );
    if (newExpense != null) {
      setState(() {
        expenses.add(newExpense);
      });
    } else {
      print("created has been canceled");
    }
  }

  void deleteExpense(int index, DismissDirection direction) {
    final Expense removed = expenses[index];

    setState(() {
      expenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${removed.title} | index: $index has been remove.",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: "Undo",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          onPressed: () => onUndo(index, removed),
        ),
      ),
    );
  }

  void onUndo(int index, Expense toRestore) {
    setState(() {
      expenses.insert(index, toRestore);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${toRestore.title} | index: $index has been restore.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Ronan the Best"),
        actionsPadding: EdgeInsets.all(10),
        actions: [
          IconButton(onPressed: () => onSave(context), icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ExpenseStatistic(allExpenses: expenses),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ExpenseList(
                  expenses: expenses,
                  removeExpense: deleteExpense,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//itemBuilder: createItem
// or
//itemBuilder: (context, index) => createItem(context, index),

// List.separte(separatorBuilder: (BuildContext context, int index) => const Divider(),),

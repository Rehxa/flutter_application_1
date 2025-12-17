import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/Expense.dart';

class ExpenseSheet extends StatefulWidget {
  const ExpenseSheet({super.key});

  @override
  State<ExpenseSheet> createState() => _ExpenseSheetState();
}

class _ExpenseSheetState extends State<ExpenseSheet> {
  final _titleController = TextEditingController();
  final _numController = TextEditingController();
  ExpenseType expenseType = ExpenseType.lersure;
  DateTime? date;

  Widget get showDate => date != null
      ? Text(date.toString().split(" ")[0])
      : Text("No Date Seleted");

  void onPop() {
    Navigator.pop(context);
    print("pop");
  }

  void create() {
    if (_titleController.text == "") {
      alertPopup("Title");
    }
    if (_numController.text == "") {
      alertPopup("Price");
    }
    if (date == null) {
      alertPopup("Date");
    }
    if (_titleController.text != "" &&
        _numController.text != "" &&
        date != null) {
      Expense? newExpense = Expense(
        title: _titleController.text,
        amount: double.parse(_numController.text),
        date: date!,
        typeofExpense: expenseType,
      );
      print("created");

      Navigator.pop<Expense>(context, newExpense);
    }
  }

  void alertPopup(String alertType) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Invalid!"),
        content: Text("$alertType is empty"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? select = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (select != null && date != select) {
      setState(() {
        date = select;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _numController.dispose();
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: Column(
        spacing: 10,
        children: [
          Text(
            "Add Expense",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(label: Text("Title")),
              maxLength: 50,
            ),
          ),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _numController,
                    decoration: InputDecoration(
                      label: Text("Price"),
                      prefix: Text("\$"),
                    ),
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async => selectDate(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [showDate, Icon(Icons.calendar_month)],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: expenseType,
                    isExpanded: true,
                    items: ExpenseType.values.map((t) {
                      return DropdownMenuItem<ExpenseType>(
                        value: t,
                        child: Text(t.name),
                      );
                    }).toList(),
                    onChanged: (ExpenseType? selected) {
                      setState(() {
                        expenseType = selected!;
                      });
                    },
                  ),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: ElevatedButton(
                      onPressed: create,
                      child: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: onPop,
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // CalendarDatePicker(initialDate: DateTime.now(), firstDate: firstDate, lastDate: lastDate, onDateChanged: onDateChanged)
        ],
      ),
    );
  }
}

// class Alert extends StatelessWidget {
//   const Alert({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(title: Text("invalid"), content: Text("input is empty"));
//   }
// }

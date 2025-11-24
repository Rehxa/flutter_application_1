import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  String input = "";

  void updateInput(String temp) {
    setState(() {
      input = temp;
    });
  }

  double celciusToFarenheit(String input) {
    double? celcius = double.tryParse(input);
    if (celcius == null) {
      return 0;
    }

    return ((celcius * (9 / 5)) + 32);
  }

  Widget errorMsg(String input) {
    if (input == "") {
      return SizedBox(height: 20);
    }

    double? checkdouble = double.tryParse(input);
    if (checkdouble == null) {
      return Text(
        "Error!, please enter numbers only!",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      );
    }

    return SizedBox(height: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              onChanged: updateInput,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            errorMsg(input),
            const SizedBox(height: 10),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('${celciusToFarenheit(input)}'),
            ),
            //Todo
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: widget.onPressed,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text(
                  'Back to Main',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

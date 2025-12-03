import 'package:flutter/material.dart';

// The factorial of numbers greater than 20 is too large for a standard 64-bit integer.
// We define this as a global constant to prevent "magic numbers" in our code.
const int maxFactorialInput = 20;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Using theme data to set a consistent color scheme.
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Factorial Calculator"),
        ),
        body: const Center(
          child: Calculator(),
        ),
      ),
    );
  }
}

/// A stateful widget that manages the overall calculator state.
///
/// It holds the result of the calculation and the logic to perform it.
/// It's stateful because the displayed result needs to change when the
/// user performs a calculation.
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // The state variable that holds the result. We use a String so we can
  // display not just numbers, but also error messages like "Invalid Input".
  String _result = "0";

  /// This is the callback method that the child widget will call.
  /// It handles the business logic of the calculator.
  void _calculateFactorial(String inputText) {
    // We use int.tryParse instead of int.parse because it doesn't crash the
    // app if the text is not a valid number. It returns null instead.
    final int? n = int.tryParse(inputText);

    String newResult;

    if (n == null) {
      newResult = "Invalid Input";
    } else if (n < 0) {
      newResult = "Negative numbers are not allowed";
    } else if (n > maxFactorialInput) {
      newResult = "Number is too large";
    } else {
      // If input is valid, calculate the factorial and convert it to a string.
      newResult = factorial(n).toString();
    }

    // We call setState to update our state variable and trigger a UI rebuild.
    setState(() {
      _result = newResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using Padding to give the UI some breathing room around the edges.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // Aligns the children to the center of the column.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // This Text widget displays the result from our state.
          Text(
            _result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          // A SizedBox is a simple way to add a fixed amount of space between widgets.
          const SizedBox(height: 20),
          // We pass our calculation method down to the Input widget. This pattern
          // is called "lifting state up", where the parent manages the state
          // and passes callback functions to its children.
          CalculatorInput(onCalculate: _calculateFactorial),
        ],
      ),
    );
  }
}

/// A stateful widget that handles user input.
///
/// It's stateful because it needs to manage a TextEditingController, which is
/// an object that can change over its lifetime.
class CalculatorInput extends StatefulWidget {
  // This widget accepts a function as a parameter. This is the callback
  // it will execute when the user presses the button.
  final void Function(String) onCalculate;

  const CalculatorInput({super.key, required this.onCalculate});

  @override
  State<CalculatorInput> createState() => _CalculatorInputState();
}

class _CalculatorInputState extends State<CalculatorInput> {
  // A controller is used to read and manage the text of a TextField.
  late final TextEditingController _controller;

  // initState is a lifecycle method called once when the widget is first created.
  // It's the perfect place to initialize objects like controllers.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // dispose is a lifecycle method called when the widget is permanently removed.
  // It's crucial to dispose of controllers to free up resources and prevent memory leaks.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          // A keyboard specifically for numbers improves the user experience.
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32),
          // InputDecoration styles the TextField.
          decoration: const InputDecoration(
            hintText: "Enter a number",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        // An ElevatedButton provides a more prominent, clickable area.
        ElevatedButton(
          // When pressed, we call the 'onCalculate' function that was passed
          // in from the parent widget, sending the current text from our controller.
          onPressed: () => widget.onCalculate(_controller.text),
          child: const Text("Calculate Factorial"),
        ),
      ],
    );
  }
}

/// A simple, recursive function to calculate the factorial of a non-negative integer.
int factorial(int n) {
  // The base case for the recursion: factorial of 0 is 1.
  if (n == 0) return 1;
  // The recursive step: n! = n * (n-1)!
  return n * factorial(n - 1);
}
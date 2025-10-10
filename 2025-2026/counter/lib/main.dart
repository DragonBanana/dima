import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter")),
        body: const Center(
          // We are using the Counter widget, which will manage its own state.
          child: Counter(),
        ),
      ),
    );
  }
}

// StatefulWidgets are used when a part of the UI needs to change dynamically
// during runtime, usually in response to user interaction or data being fetched.
// A StatefulWidget is made of two classes. This first class is immutable.
class Counter extends StatefulWidget {
  const Counter({super.key});

  // This method is the key difference from a StatelessWidget. It creates an
  // instance of its associated "State" class, which handles all the mutable data.
  @override
  State<Counter> createState() => CounterState();
}

// This is the second class, the State object. It holds the mutable data
// (the state) and the logic for the widget. The leading underscore convention
// is often used to make the State class private.
class CounterState extends State<Counter> {
  // This is our "ephemeral state". It's called ephemeral because this data
  // is simple, local, and contained entirely within this single widget.
  // We don't need to share the counter's value with other screens or widgets.
  int counter = 0;

  // This method modifies our state.
  void incrementCounter() {
    // To change the state and trigger a UI update, we MUST call setState().
    // Simply writing `counter = counter + 1;` would change the variable's
    // value, but Flutter wouldn't know it needs to rebuild the widget,
    // so the user wouldn't see the change on the screen.
    setState(() {
      // The code inside this callback function is executed, and then Flutter
      // re-runs the build() method to display the updated state.
      counter = counter + 1;
    });
  }

  // Another method to modify the state, also correctly using setState().
  void decrementCounter() {
    setState(() {
      // It's a good practice to include logic inside setState if it's simple.
      if (counter > 0) {
        counter = counter - 1;
      }
    });
  }

  /// Helper methods (often prefixed with a `_`) are a great way to keep
  /// your main `build` method clean and organized. This one builds the text display.
  Widget _buildCounterText() {
    // We can use the state to conditionally render different widgets.
    // This is a "ternary operator": if counter is NOT 42, show the Text.
    // Otherwise (`:`), show the CircularProgressIndicator.
    return counter != 42
        ? Text(
            "$counter",
            style: const TextStyle(fontSize: 48),
          )
        : const CircularProgressIndicator(
            backgroundColor: Colors.grey,
          );
  }

  /// This helper method builds the row of buttons.
  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          // Using a custom style for the button's appearance.
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          // When pressed, this button calls our state-mutating method.
          onPressed: () => decrementCounter(),
          icon: const Icon(Icons.remove),
        ),
        IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          onPressed: () => incrementCounter(),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  // The 'dispose' method is part of the widget's lifecycle. It's called when
  // the widget is permanently removed from the screen. This is where you
  // would clean up resources like animation controllers or data streams.
  @override
  void dispose() {
    // It's crucial to call super.dispose() to let the parent class do its own cleanup.
    super.dispose();
  }

  // The build method for a State object works just like in a StatelessWidget,
  // but it gets re-run every time setState() is called.
  @override
  Widget build(BuildContext context) {
    // The UI is built here based on the CURRENT state.
    // When 'counter' changes, this method re-builds the Column and its children.
    return Column(
      // Centering the content inside the column.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Using our helper methods makes the build method very readable.
        _buildCounterText(),
        // Adding some space between the text and buttons.
        const SizedBox(height: 20),
        _buildButtonRow(),
      ],
    );
  }
}
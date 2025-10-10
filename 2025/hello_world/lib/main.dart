// The 'material.dart' package contains all the pre-made widgets and tools
// that follow Google's Material Design guidelines. We import it to build our UI.
import 'package:flutter/material.dart';

// The main() function is the starting point for every Dart application.
// Flutter starts executing the code from here.
void main() {
  // runApp() is a built-in Flutter function that takes the root widget of your
  // app and attaches it to the screen. In this case, our root widget is MyApp.
  runApp(const MyApp());
}

/// MyApp is the root widget of our application.
///
/// It's a StatelessWidget, which means it describes a part of the user
/// interface which can’t change over time. It's like a painted picture:
/// once drawn, it doesn't change on its own.
class MyApp extends StatelessWidget {
  /// The constructor for MyApp.
  ///
  /// The 'const' keyword means this widget is immutable (cannot be changed)
  /// and can be created at compile-time, which is a performance boost.
  /// The '{super.key}' part passes the optional 'key' parameter to the parent
  /// StatelessWidget, which Flutter uses to identify and manage widgets efficiently.
  const MyApp({super.key});

  // The build() method is the most important method in any widget.
  // It describes how to display the widget in terms of other, lower-level widgets.
  // Flutter calls this method whenever it needs to draw this widget on the screen.
  // The 'context' parameter contains information about the widget's location in the tree.
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a core widget that provides many features needed for an app,
    // such as routing (for navigating between screens) and theme data.
    // It's usually the root of your app's widget tree.
    return MaterialApp(
      // The title is used by the device's operating system to identify the app.
      title: 'Hello World',

      // The 'home' property defines the default screen (or "route") of the app.
      // We are using a Scaffold widget here.
      // A Scaffold provides a standard visual layout for a screen. Think of it
      // as a blank page in a book that gives you an app bar, a body, etc.
      home: Scaffold(
        // The appBar is the toolbar that appears at the top of the screen.
        appBar: AppBar(
          title: const Text("Helloo World"),
        ),
        // The 'body' is the primary content of the screen, displayed below the app bar.
        // We use a Center widget to align its child to the center of the screen.
        body: const Center(
          // Column is a layout widget that arranges its children vertically.
          child: Column(
            // This aligns the children to the vertical center of the Column.
            mainAxisAlignment: MainAxisAlignment.center,
            // 'children' is a list of all the widgets to display inside the Column.
            children: [
              // Here we are creating instances of our custom widgets.
              HelloWorld(),
              HelloWorldGenerator(10),
              HelloWorldPlus(10),
              HelloWorldPlus.withBlue(11), // A trailing comma is a good practice in Flutter.
                                            // It makes code auto-formatting cleaner.
            ],
          ),
        ),
      ),
    );
  }
}

/// A simple widget that displays the text "Hello World".
class HelloWorld extends StatelessWidget {
  /// Creates a HelloWorld widget.
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget returns a Text widget, which is used to display strings.
    return const Text(
      "Hello World",
      // The 'style' property lets us customize the text's appearance.
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}

/// A more advanced widget that displays "Hello World" followed by a number.
/// It can also be customized with a specific color.
class HelloWorldPlus extends StatelessWidget {
  /// The number to be displayed next to the text.
  final int number;

  /// The color of the text.
  final Color color;

  /// The default constructor for HelloWorldPlus.
  ///
  /// 'this.number' is a shorthand way to assign the 'number' parameter to the
  /// 'number' property of the class. This is called an "initializing formal".
  /// The parameter 'color' is optional and has a default value of Colors.red.
  const HelloWorldPlus(this.number, {this.color = Colors.red, super.key});

  /// A "named constructor" that provides an alternative way to create this widget.
  /// This specific one always creates the widget with blue text.
  ///
  /// The line ': color = Colors.blue' is an "initializer list". It runs before
  /// the constructor body and is used to set final properties like 'color'.
  const HelloWorldPlus.withBlue(this.number, {super.key}) : color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Text(
      // '$number' is an example of "string interpolation" in Dart.
      // It allows us to easily embed the value of a variable inside a string.
      "Hello World $number",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color, // We use the 'color' property passed to the constructor.
      ),
    );
  }
}

/// A widget that generates a vertical list of [HelloWorldPlus] widgets.
class HelloWorldGenerator extends StatelessWidget {
  /// The total number of "Hello World" widgets to generate.
  final int count;

  /// Creates a HelloWorldGenerator widget.
  const HelloWorldGenerator(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    // We create an empty list that will hold our generated widgets.
    // List<Widget> is an example of a "generic type", meaning it's a list
    // that is specifically designed to only hold Widget objects.
    List<Widget> childList = [];

    // A 'for' loop that runs 'count' times to create the widgets.
    for (int i = 0; i < count; i++) {
      // In each iteration, we add a new HelloWorldPlus widget to our list.
      childList.add(
        HelloWorldPlus(
          i, // The number passed to the widget is the current loop index.
          // We dynamically calculate a new color for each widget.
          color: Color.fromRGBO(
            // The Color.fromRGBO constructor takes Red, Green, Blue, and Opacity values.
            // Red, Green, and Blue must be integers between 0 and 255.
            // Opacity is a double between 0.0 (transparent) and 1.0 (opaque).

            // We use the modulo operator (%) to ensure the color values cycle
            // and always stay within the valid 0-255 range.
            16 * i % 255, // Red value
            32 * i % 255, // Green value
            64 * i % 255, // Blue value
            1.0,          // Opacity (fully opaque)
          ),
        ),
      );
    }

    // Finally, we return a Column whose children are the list of widgets we just generated.
    return Column(children: childList);
  }
}
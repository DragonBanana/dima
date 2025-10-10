import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The 'theme' property lets you define a consistent visual style for the entire app.
      // ThemeData holds information about colors, fonts, component styles, and more.
      theme: ThemeData(
        // brightness: Brightness.light sets the overall theme to a light mode.
        brightness: Brightness.light,
        // primarySwatch defines a single color that Flutter uses to generate
        // a palette of related shades for different parts of the UI (like the AppBar).
        primarySwatch: Colors.teal,
        // useMaterial3: true opts into the latest version of Google's Material Design.
        useMaterial3: true,
      ),
      // 'darkTheme' provides a separate ThemeData that is automatically used
      // when the user's device is in dark mode.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Viewer")),
        body: const Center(
          // We are placing our custom button in the center of the screen.
          child: MainButton(),
        ),
      ),
    );
  }
}

/// A button that, when pressed, opens an image viewer dialog.
class MainButton extends StatelessWidget {
  // Adding 'const' to the constructor improves performance because Flutter
  // knows this widget's properties will never change after it's created.
  const MainButton({super.key});

  // The @override annotation is not required, but it's a good practice.
  // It tells the Dart compiler that you are intentionally replacing a method
  // from the parent class (in this case, StatelessWidget's build method).
  @override
  Widget build(BuildContext context) {
    // IconButton is a picture-only button that reacts to touches.
    return IconButton(
      // The 'onPressed' property requires a function that will be executed
      // when the user taps the button. A value of 'null' would disable the button.
      // Here, we use an "arrow function" `() => ...` which is a shorthand for
      // writing a function that contains only a single expression.
      onPressed: () => showDialog(
        // 'context' is passed to showDialog so it knows where to display the dialog
        // in the widget tree.
        context: context,
        // The 'builder' property creates the content of the dialog.
        // It's a function that returns the widget to be displayed inside.
        builder: (context) => const Viewer(),
      ),
      // The 'icon' property defines the visual appearance of the button.
      icon: const Icon(Icons.search),
    );
  }
}

// A simple list of strings, defined globally so it can be accessed from anywhere.
// Each string is a URL pointing to a random image from the picsum.photos service.
const List<String> urls = [
  "https://picsum.photos/300/300?random=1",
  "https://picsum.photos/300/200?random=2",
  "https://picsum.photos/300/200?random=3",
];

/// A dialog widget that displays a scrollable list of images from the web.
class Viewer extends StatelessWidget {
  const Viewer({super.key});

  @override
  Widget build(BuildContext context) {
    // Here, we transform our list of URL strings into a list of Image widgets.
    // This is a common and powerful pattern in Dart.
    List<Image> images = urls
        .map(
          // The .map() method iterates over every item in the 'urls' list.
          // For each string 's' in the list, it executes this function...
          (s) => Image.network(s),
        )
        // .map() returns an 'Iterable', so we call .toList() to convert it
        // back into a 'List' of Image widgets.
        .toList();

    // ListView is a widget that creates a scrollable list of children.
    // It's one of the most common scrolling widgets in Flutter.
    return ListView(
      // The 'children' property takes a list of widgets to display.
      children: [
        // The "spread operator" (...) is a clean way to insert all the elements
        // from one list into another. This line is equivalent to adding each
        // image from the 'images' list here one by one.
        ...images,
      ],
    );
  }
}
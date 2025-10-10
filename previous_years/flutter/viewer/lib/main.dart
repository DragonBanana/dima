import 'dart:html';

import 'package:flutter/material.dart';

/*
https://picsum.photos/300/200?random=1
https://picsum.photos/300/200?random=2
https://picsum.photos/300/200?random=3
*/

// Example of pictures
var urls = const [
  "https://picsum.photos/300/200?random=1",
  "https://picsum.photos/300/200?random=2",
  "https://picsum.photos/300/200?random=3",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image viewer',
      home: Scaffold(
        appBar: AppBar(title: const Text("Image viewer")),
        body: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  // Controller of the textfield
  // It is needed to retrieve the text from the component
  final myController = TextEditingController(text: "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif");
  Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // In the column we have three subcomponents, which are:
        // A text, a textfield and a button
        const Text("Insert URLs and press the button for WOW"),
        // In this textfield we insert the URLs
        TextField(
          controller: myController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        // This button when pressed, shows the images
        TextButton(
            // OnPressed is triggered when the button is clicked
            onPressed: () => showDialog(
                context: context,
                builder: (context) => ImageDialog(
                      // The "split('\n')" method splits a sentence using '\n' as separator
                      // e.g., "So much Wow".split(" ") returns ["So", "much", "Wow"]
                      // e.g., "AlphaXBetaXGamma".split("X") returns ["Alpha", "Beta", "Gamma"]
                      myController.text.split("\n"),
                    )),
            child: const Text("Show me the WOW")),
      ],
    );
  }
}

class ImageDialog extends StatelessWidget {
  // Dart support generic types
  // In this case we have a list of strings
  final List<String> urls;

  const ImageDialog(this.urls, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Functional code
    // urls is a list of strings
    // map is a method that applies a function to each element of the list
    // for example:
    // [1,2,3,4].map( (x) => x+1 ).toList()
    // returns [2,3,4,5]
    // "(x) => x+1" can be seen as:
    // f(x) {
    //   return x + 1
    // }
    List<Image> images = urls.map((url) => Image.network(url)).toList();

    return ListView(
      children: [
        // List spread operation
        // for example:
        // initial = [1,2,3]
        // target = [a,b,1,2,3]
        // we can obtain target using target = [a,b,...initial]
        ...images,
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Enough WOW for now")),
      ],
    );
  }
}

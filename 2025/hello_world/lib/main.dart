import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HelloWorldPlus(Colors.blue, 10),
        ),
      ),
    );
  }
}

class HelloWorld extends StatelessWidget {

  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World", style: TextStyle(fontSize: 48));
  }

}

class HelloWorldPlus extends StatelessWidget {

  final Color color;
  final int number;

  const HelloWorldPlus(this.color, this.number, {super.key});

  @override 
  Widget build(BuildContext ctx) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 48, color: color),
    );
  }

}
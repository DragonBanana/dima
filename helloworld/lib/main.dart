import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(title: const Text("Hello World")),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HelloWorld(),
              HelloWorldGenerator(10),
              HelloWorldPlus(10),
              HelloWorldPlus.withBlue(11),
            ],
          ))),
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500));
  }
}

class HelloWorldPlus extends StatelessWidget {
  final int number;
  final Color color;

  const HelloWorldPlus(this.number, {this.color = Colors.red, Key? key}): super(key: key);

  const HelloWorldPlus.withBlue(this.number, {Key? key}): color = Colors.blue, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color),
    );
  }
}

class HelloWorldGenerator extends StatelessWidget {
  final int count;

  const HelloWorldGenerator(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = [];
    for (int i =0; i < count; i++) {
      childList.add(
        HelloWorldPlus(i, color: Color.fromRGBO(
          16 * i % 255,
          32 * i % 255,
          64 * i  % 255, 
          1.0,
          ))
      );
    }
    return Column(children: childList);
  }
}
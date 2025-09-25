// import 'package:calculator/factorial.dart';
// import 'package:calculator/power.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Hello World App")),
            body: const Calculator()));
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              ListenChangeNotifier(),
              Factorial(
              ),
              Power(
              )
            ]));
  }
}

// ChangeNotifier is a pattern of Flutter Provider
// It should be use when we want to notify a change
// in state that contains multiple values
// When the state is composed by only one value
// we can use ValueNotifier
class ResultNotifier extends ChangeNotifier {
  int _result = 0;

  void setResult(result) {
    _result = result;
    notifyListeners();
  }

  int getResult() => _result;

}

class ListenChangeNotifier extends StatefulWidget {
  const ListenChangeNotifier({Key? key}) : super(key: key);

  @override
  State<ListenChangeNotifier> createState() =>
      _ListenChangeNotifierState();
}

ResultNotifier resultNotifier = ResultNotifier();

class _ListenChangeNotifierState extends State<ListenChangeNotifier> {
  @override
  void initState() {
    super.initState();
    // mounted means object is currently in the widget tree
    // Whenever the notifier calls "notifyListeners"
    // all callbacks will be called
    resultNotifier.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  // "dispose" is a method that will be called
  // when the widget is removed from the widget tree
  void dispose() {
    resultNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.red,
    child: Center(
        child: Text(resultNotifier.getResult().toString(),
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white))));
  }

}


class Factorial extends StatefulWidget {
  const Factorial({Key? key}) : super(key: key);
  
  @override
  _FactorialState createState() => _FactorialState();
}

class _FactorialState extends State<Factorial> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.blue),
          controller: myController),
      TextButton(
          style: buttonStyle,
          onPressed: () {
              resultNotifier.setResult(factorial(int.parse(myController.text)));
              myController.clear();
          }, 
          child: const Text("FACTORIAL"))
    ]);
  }

}

var buttonStyle = TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.greenAccent);

int factorial(n) {
  if (n == 0) return 1;
  return n * factorial(n - 1);
}

int power(a, b) {
  if (b == 0) return 1;
  return a * power(a, b - 1);
}

class Power extends StatefulWidget {
  const Power({Key? key}) : super(key: key);

  @override
  _PowerState createState() => _PowerState();
}

class _PowerState extends State<Power> {
  final baseController = TextEditingController();
  final expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 100,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                  controller: baseController,
                )),
            const Text("^"),
            SizedBox(
                width: 100,
                child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                    controller: expController)),
          ]),
      TextButton(
          style: buttonStyle,
          onPressed: () {
            resultNotifier.setResult(power(int.parse(baseController.text), int.parse(expController.text)));
            baseController.clear();
            expController.clear();
          },
          child: const Text("POWER"))
    ]);
  }

}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Counter")),
            body: const Counter()));
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  // A stateful widget must
  // override the createState method
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    // Whenever the state changes
    // it is mandatory to call "setState"
    setState(() {
      if (counter < 100) {
        // Inside setState 
        // insert only the code that changes the state
        counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void setCounter(double newValue) {
    setState(() {
      counter = newValue.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                color: Colors.blue,
                child: Center(
                  child: Text("$counter",
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.pinkAccent),
                child: const Icon(Icons.remove),
                // By reading the documentation
                // we can find that, to disable the textbutton,
                // we can just set "onPressed" to null
                onPressed: counter == 0 ? null : decrementCounter,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.pinkAccent),
                child: const Icon(Icons.add),
                onPressed: counter == 100 ? null : incrementCounter,
              )
            ]),
            // Slider
            // If the value of the slider overflowers
            // an error is generated
            Slider(
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.blueGrey,
                value: counter.toDouble(),
                min: 0,
                max: 100,
                divisions: 100,
                // onChanged callback
                onChanged: setCounter),
            // Ternary operator
            // <condition> ? <if_true> : <if_false>
            // In this case, we display a column if counter < 100
            // Otherwise we display a text
            counter < 100
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ProgressIndicator
                      // Overflow does not make it crash
                      // We should be careful when we are
                      // dealing with illegal values
                      // Alternatives are:
                      // CircularProgressIndicator, RefreshProgressIndicator
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                        value: counter.toDouble() / 100,
                      ),
                      Text('${(counter.toDouble()).round()}%'),
                    ],
                  )
                : const Text("Banana!")
          ],
        ));
  }
}

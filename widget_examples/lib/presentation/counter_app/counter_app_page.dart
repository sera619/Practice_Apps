// ignore_for_file: prefer_const_constructors
import 'package:clear_architecture/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CounterAppPage extends StatefulWidget {
  const CounterAppPage({Key? key}) : super(key: key);

  @override
  State<CounterAppPage> createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  int _counter = 0;
  Color _newColor = Colors.grey.shade400;
  void _incrementCounter() {
    // nutzen zum ändern on runtime
    setState(() {
      _newColor = Colors.green.shade500;
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _newColor = Colors.red.shade700;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Material(
          elevation: 30,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _newColor,
            ),
            height: 200,
            width: 260,
            child: Column(children: [
              SizedBox(height: 20),
              Text("Counter",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  )),
              SizedBox(height: 25),
              Text(
                _counter.toString(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  CustomButton(
                    onPressed: () => _incrementCounter(),
                    text: "Increment",
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    onPressed: () => _decrementCounter(),
                    text: 'Decrement',
                  ),
                  SizedBox(width: 5),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

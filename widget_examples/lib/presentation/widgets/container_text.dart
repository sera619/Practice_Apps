// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({Key? key}) : super(key: key);  
  @override
  Widget build(BuildContext context) {
  // ignore: prefer_const_literals_to_create_immutables
  final LinearGradient _orangeGradient = LinearGradient(colors: [
      Color.fromARGB(255, 253, 226, 152),
      Color.fromARGB(255, 235, 207, 85),
      Color.fromARGB(255, 228, 156, 0),
      Color.fromARGB(255, 212, 96, 1),
      Color.fromARGB(255, 240, 36, 0),
    ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
    return Center(
        child: Container(
            height: 80,
            width: 280,
            decoration: BoxDecoration(
                gradient: _orangeGradient,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 20,
                  child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: Text("Example Text Container",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                        ))),
            )));
  }
}

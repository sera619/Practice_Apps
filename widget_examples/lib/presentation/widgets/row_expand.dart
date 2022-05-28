import 'package:flutter/material.dart';

class RowExpand extends StatelessWidget {
  const RowExpand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 20,
          width: 60,
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            
            margin: const EdgeInsets.all(10),
            height: 20,
            width: 60,
            color: Colors.redAccent[700],
          ),
        ),
        Container(
          height: 20,
          width: 60,
          color: Colors.black,
        ),
    ]);
  }
}

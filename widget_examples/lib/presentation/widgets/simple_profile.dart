// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SimpleProfile extends StatelessWidget {
  const SimpleProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 200,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            child: CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage('assets/images/Logo.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height:60,
              width: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(121, 182, 170, 170).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'S3R43o3',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Developer',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )
                    )
                  ],
                )
            )
          )
        ]
      )
    );
  }
}
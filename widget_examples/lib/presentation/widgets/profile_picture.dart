// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clear_architecture/theme.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
        height: 240,
        width: 240,
        child: Stack(
            // ignore: prefer_const_constructors
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        gradient: LinearGradient(colors: [
                          Colors.redAccent.shade700.withAlpha(100),
                          Colors.black,
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  )),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    radius: 200,
                    backgroundImage: AssetImage('assets/images/Logo.jpg'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 500,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(120, 119, 3, 3),
                          Color.fromARGB(190, 119, 3, 3),
                          Color.fromARGB(245, 102, 1, 1),
                          Color.fromARGB(250, 97, 2, 2),
                          Color.fromARGB(252, 82, 2, 2),
                          Color.fromARGB(255, 41, 1, 1),
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "S3R43o3",
                          style: TextStyle(
                              fontFamily: 'Nocen',
                              color: Color.fromARGB(255, 231, 230, 230),
                              fontSize: 16),
                        ),
                        Text(
                          "Developer",
                          style: TextStyle(
                              color: Color.fromARGB(255, 184, 0, 0),
                              fontFamily: 'Nocen',
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    )),
              )
            ]));
  }
}

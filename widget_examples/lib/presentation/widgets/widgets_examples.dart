// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:clear_architecture/presentation/widgets/pageview_example.dart';
import 'package:clear_architecture/presentation/widgets/mediaquery.dart';
import 'package:flutter/material.dart';
import 'container_text.dart';
import 'row_expand.dart';
import 'profile_picture.dart';
import 'custom_button.dart';
import './mediaquery.dart';

class WidgetsExample extends StatelessWidget {
  const WidgetsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // turn off debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Icon(Icons.home, size: 30),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text('Example Widgets',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Nocen'          
          ),),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 35),
                ProfilePicture(),
                SizedBox(height: 35),
                RowExpand(),
                SizedBox(height: 35),
                ContainerText(),
                SizedBox(height: 35),
                RowExpand(),
                SizedBox(height: 35),
                MediaQueryExample(),
                SizedBox(height: 35),
                PageViewExample(),
                SizedBox(height: 35),
                CustomButton(onPressed: ()=>{
                 Navigator.of(context).pushNamed('/counter')
                }, text: 'Counter'),
                SizedBox(height: 70),
                

              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_firebase/theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Info'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
           
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: size.height * .75,
                width: size.width * 0.7,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10)
                ),),
            ),
          ),
        
          ),
      );

  }
}

import 'package:flutter/material.dart';
import 'package:todo_firebase/theme.dart';

class CustomBTN extends StatelessWidget {
  final Function onPressed;

  final double height;
  final double width;
  final String text;


  const CustomBTN({Key? key,
    required this.onPressed,

    required this.height,
    required this.width,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      splashColor: AppTheme.headCyan,
      onTap: () => onPressed(),
      splashFactory: InkRipple.splashFactory,
      child: Material(
        elevation: 15,
        shadowColor: AppTheme.darkerCyan,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppTheme.blueGradient,
          ),
          child:Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            )
          ),
        )
        ),
    );
  }
}

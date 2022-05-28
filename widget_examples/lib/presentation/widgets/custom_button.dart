import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.orange[900],
        onTap: () => onPressed(),
        child: Material(
          elevation: 6,
          shadowColor: Colors.amber.shade600,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.orange.shade900,Colors.orange.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1),
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:todo_firebase/theme.dart';

class InfoBTN extends StatelessWidget {
  final String label;
  final Function onPressed;

  const InfoBTN({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => {onPressed()},
      child: Container(
        height: 45,
        width: 140,
        decoration: BoxDecoration(gradient: AppTheme.blueGradient),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

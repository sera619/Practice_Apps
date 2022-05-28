import 'package:clear_architecture/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text('Page One'),
          centerTitle: true,
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: () => {Navigator.of(context).pushNamed('/page2')},
                text: 'Page Two'),
            SizedBox(width: 14),
            CustomButton(
                onPressed: () => {Navigator.of(context).pushNamed('/page2')},
                text: 'Page Two'),
          ],
        )));
  }
}

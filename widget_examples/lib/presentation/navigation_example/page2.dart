import 'package:clear_architecture/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class PageTwo extends StatelessWidget {
  const PageTwo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
      title: Text('Page Two'),
      centerTitle: true,
      ),
      body: Center(
        child: CustomButton(onPressed: ()=>{
          Navigator.of(context).pushNamed('/page1')
        },text: 'Page one')
        )
    );
  }
}
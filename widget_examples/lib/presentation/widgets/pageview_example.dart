// ignore_for_file: prefer_const_constructors

import 'package:clear_architecture/application/theme_service.dart';
import 'package:clear_architecture/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.95,
      child: PageView(
        //
        controller: PageController(viewportFraction: 0.93),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SinglePage(
                size: size,
                title: 'Default',
                text:
                    'Die ist ein Testtext der testet Texte um zu sehen ob der Text auch richtig formatiert wird oder es hier aussieht wie Kraut und Rüben.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SinglePage(
                size: size,
                title: 'Seraphinus',
                text:
                    'Die ist ein Testtext der testet Texte um zu sehen ob der Text auch richtig formatiert wird oder es hier aussieht wie Kraut und Rüben.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SinglePage(
                size: size,
                title: 'S3R43o3',
                text:
                    'Die ist ein Testtext der testet Texte um zu sehen ob der Text auch richtig formatiert wird oder es hier aussieht wie Kraut und Rüben.'),
          ),
        ],
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  final Size size;
  final String title;
  final String text;

  const SinglePage({Key? key, required this.size, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Gradient darkGradient = AppTheme.verticalblueGradient;
    const Gradient lightGradient = AppTheme.verticalOrangeGradient;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        gradient: Provider.of<ThemeService>(context).isDarkModeOn ? darkGradient : lightGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
          padding: EdgeInsets.all(20),
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: 'Nocen',
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              IconButton(
                splashColor: Colors.black,
                onPressed: () => {print('test')},
                icon: Icon(
                  Icons.more_outlined,
                  size: 40,
                ),
                color: Colors.white,
              ),
            ],
          )),
    );
  }
}

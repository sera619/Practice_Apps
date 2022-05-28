// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clear_architecture/application/theme_service.dart';
import 'package:clear_architecture/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const String headText = 'Andere Farbe?';
    const String bodyText = 'Ändere das Design der App.';
    const String blueThemeText = 'Blue Mode';
    const String redThemeText = 'Red Mode';
    const Gradient _blueGradient = AppTheme.blueGradient;
    const Gradient _orangeGradient = AppTheme.orangeGradient;
    final ThemeData themeData = Theme.of(context);
    final ThemeService themeService = Provider.of<ThemeService>(context);
    return Consumer<ThemeService>(builder: (context, state, child) {
      return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.palette_outlined,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text('Theme',style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Nocen'
            
            ),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Material(
                elevation: 10,
                shadowColor: Theme.of(context).cardTheme.shadowColor,
                borderRadius: BorderRadius.circular(25),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.8,
                    maxHeight: size.height * 0.6,
                  ),
                  child: Container(
                    height: size.height * 0.6,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: themeService.isDarkModeOn ? _blueGradient : _orangeGradient,
                    ),
                    child: Stack(children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 250,
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            gradient: themeService.isDarkModeOn ? _orangeGradient : _blueGradient,
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(headText, style: Theme.of(context).textTheme.headline1),
                            SizedBox(height: 20),
                            Text(bodyText, style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  themeService.isDarkModeOn ? redThemeText : blueThemeText,
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(fontStyle: FontStyle.normal),
                                ),
                                SizedBox(width: 10),
                                Switch(
                                    value: state.isDarkModeOn,
                                    onChanged: (bool value) {
                                      Provider.of<ThemeService>(context, listen: false)
                                          .toggleTheme();
                                    }),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}

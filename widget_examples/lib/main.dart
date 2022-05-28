import 'package:clear_architecture/application/theme_service.dart';
import 'package:clear_architecture/presentation/counter_app/counter_app_page.dart';
import 'package:clear_architecture/presentation/theme_animation/anim_page.dart';
import 'package:flutter/material.dart';
import 'package:clear_architecture/presentation/widgets/widgets_examples.dart';
import 'package:clear_architecture/root.dart';
import 'package:provider/provider.dart';
import 'presentation/navigation_example/page1.dart';
import 'presentation/navigation_example/page2.dart';
import 'theme.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ThemeService(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, state, child) {
      return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/counter': (BuildContext context) => CounterAppPage(),
            '/widgets': (BuildContext context) => WidgetsExample(),
            '/page1': (BuildContext context) => PageOne(),
            '/page2': (BuildContext context) => PageTwo(),
            '/animation': (BuildContext context) => ThemePage()
          },
          home: RootWidget());
    });
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:clear_architecture/presentation/navigation_example/page1.dart';
import 'package:clear_architecture/presentation/theme_animation/anim_page.dart';
import 'package:flutter/material.dart';
import 'package:clear_architecture/presentation/widgets/widgets_examples.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex,
          // ignore: prefer_const_literals_to_create_immutables
          children: [WidgetsExample(), PageOne(), ThemePage()]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white70,
        selectedItemColor:  Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Examples",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.route_outlined), label: "Navigation"),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette_outlined),
            label: "Theme",
            
          ),
        ],
      ),
    );
  }
}

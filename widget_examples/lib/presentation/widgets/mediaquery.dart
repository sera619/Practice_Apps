import 'package:clear_architecture/application/theme_service.dart';
import 'package:clear_architecture/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Gradient darkGradient = AppTheme.verticalblueGradient;
    const Gradient lightGradient = AppTheme.verticalOrangeGradient;

    return Container(
      height: size.height * 0.075,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          gradient: Provider.of<ThemeService>(context).isDarkModeOn ? darkGradient : lightGradient,
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(35), topRight: Radius.circular(35))),
    );
  }
}

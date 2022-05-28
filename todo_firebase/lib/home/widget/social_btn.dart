import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_firebase/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class SocialBTN extends StatelessWidget {
  final Icon icon;
  final String url;
  const SocialBTN({Key? key, required this.icon, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
    Future<void> _launchInBrowser(String url) async {
      if (await launcher.canLaunch(url)) {
        if (!await launcher.launch(
          url,
          useWebView: false,
          universalLinksOnly: false,
          enableJavaScript: false,
          enableDomStorage: false,
          headers: <String, String>{},
          useSafariVC: false,
        )) {
          throw 'could not open $url';
        }
      }
    }

    return Material(
      elevation: 10,
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(200),
      child: IconButton(
        splashRadius: 25,
        splashColor: AppTheme.headCyan,
        iconSize: 30,
        icon: icon,
        color: AppTheme.headCyan,
        onPressed: () {
          _launchInBrowser(url);
        },
      ),
    );
  }
}

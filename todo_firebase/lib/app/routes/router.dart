import 'package:auto_route/auto_route.dart';
import 'package:todo_firebase/home/home_page.dart';
import 'package:todo_firebase/home/info_page.dart';
import 'package:todo_firebase/home/splash/splash_page.dart';
import 'package:todo_firebase/res/signup_page.dart';

@MaterialAutoRouter (
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignUpPage, initial: false),
    AutoRoute(page: HomePage, initial: false),
    AutoRoute(page: InfoPage, initial: false),
  ]

)

class $AppRouter {}
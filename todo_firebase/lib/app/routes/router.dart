
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:todo_firebase/res/signup_page.dart';

@MaterialAutoRouter (
  routes: <AutoRoute>[
    AutoRoute(page: SignUpPage, initial: true),


  ]

)

class $AppRouter {}
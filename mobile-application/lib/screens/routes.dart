import 'package:flutter/cupertino.dart';

import 'home/trainer_home_layout.dart';
import 'onboarding/login_screen.dart';
import 'onboarding/splash_screen.dart';

class Routes {
  Routes._();

  static String splash = '/splash';

  static String home = '/home'; // 홈 안에 tab 형식으로 화면 2개 있음
  static String login = '/login';

  static final routes = <String, WidgetBuilder>{
    splash: (context) => SplashScreen(),
    home: (context) => TrainerHomeLayout(),
    login: (context) => LoginScreen(),
  };
}

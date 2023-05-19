import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../constants/images.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box userBox = Hive.box('USER_INFO');

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    // bool? isLoggedIn = await userBox.get('isLoggedIn') as bool?;
    // isLoggedIn != null && isLoggedIn
    //     ? Navigator.of(context).pushReplacementNamed(Routes.home)
    //     : Navigator.of(context).pushReplacementNamed(Routes.login);

    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffF8F8F8),
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: 1.0,
              child:
                  Column(children: [Image.asset(GImages.MUSCLE), const Text('Gymsome', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))]),
            ),
            Spacer(),
            Text('ⓒ 2022 Antsome Co', style: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(13)), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _init();
    return Image.asset(
      AppDrawables.splashImage,
      fit: BoxFit.cover,
    );
  }

  void _init() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(MyApp.navigatorKey.currentContext!, '/home');
  }
}

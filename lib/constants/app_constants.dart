import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';


class AppConstants {

  static String iosPackageName='com.thepetgazette';
  static  String androidPackageName='com.thepetgazette';
  Size tabBarSize() => Size(
      math.max(100, (AppStyles().width - 20) * .33),
      // 80,
      math.max(40, (AppStyles().height) * .04));

  //validation
  static int contactLength = 10;
}

import 'package:flutter/material.dart';

import '../../../constants/app_drawables.dart';

AppBar appBarHome() {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Image.asset(AppDrawables.appLogo,height: 35,),
    centerTitle: true,
  );
}
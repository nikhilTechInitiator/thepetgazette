import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_drawables.dart';


AppBar appBarDefault(String title) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: Text(
      title,
    ),
    centerTitle: true,
    elevation: 2,
  );
}



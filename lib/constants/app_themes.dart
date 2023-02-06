import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thepetgazette/constants/app_colors.dart';

ThemeData getTheme() {
  return ThemeData.light().copyWith(
    textSelectionTheme: const TextSelectionThemeData().copyWith(
      cursorColor: AppColors.textDark,
    ),
    backgroundColor: Colors.grey.shade100,
    primaryColor: Colors.black,
    checkboxTheme: ThemeData.light()
        .checkboxTheme
        .copyWith(fillColor: MaterialStateProperty.all(Colors.grey.shade900)),
    radioTheme: ThemeData.light()
        .radioTheme
        .copyWith(fillColor: MaterialStateProperty.all(Colors.grey.shade900)),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        titleTextStyle: GoogleFonts.martelSansTextTheme().titleMedium!.copyWith(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData().copyWith(color: AppColors.textDark),
        elevation: .5),
    iconTheme: ThemeData.light().iconTheme.copyWith(size: 18),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
        floatingLabelStyle:
            TextStyle(color: ThemeData.light().colorScheme.onSurface)),
    tabBarTheme: ThemeData.dark().tabBarTheme,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.textLight,
      background: Colors.grey.shade100,
      onBackground: AppColors.textDarkSecondary,
      surface: Colors.white,
      onSurface: AppColors.textDark,
      secondary: Colors.white,
      onSecondary: AppColors.textDark,
      error: Colors.red,
      onError: Colors.black,

    ),
    textTheme: GoogleFonts.martelSansTextTheme()
        .apply(displayColor: AppColors.textDark, bodyColor: AppColors.textDark)
        .copyWith(
          labelLarge: GoogleFonts.interTextTheme().labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1,
              color: AppColors.textDark),
          bodyMedium: GoogleFonts.martelSansTextTheme()
              .bodyMedium!
              .copyWith(fontSize: 13, color: AppColors.textDark),
        ),
  );
}

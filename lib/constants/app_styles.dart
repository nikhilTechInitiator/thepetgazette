import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:thepetgazette/constants/app_colors.dart';
import 'package:thepetgazette/main.dart';

class AppStyles {

  var pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  var physicalScreenSize = window.physicalSize;
  double width = window.physicalSize.width;
  double height = window.physicalSize.height;

  //Size in logical pixels
  var logicalScreenSize = window.physicalSize / window.devicePixelRatio;
  var logicalWidth = (window.physicalSize / window.devicePixelRatio).width;
  var logicalHeight = (window.physicalSize / window.devicePixelRatio).height;

  //Padding in physical pixels
  var padding = window.padding;

  //Safe area paddings in logical pixels
  var paddingLeft = window.padding.left / window.devicePixelRatio;
  var paddingRight = window.padding.right / window.devicePixelRatio;
  var paddingTop = window.padding.top / window.devicePixelRatio;
  var paddingBottom = window.padding.bottom / window.devicePixelRatio;

  // //Safe area in logical pixels
  // var safeWidth = logicalWidth - paddingLeft - paddingRight;
  // var safeHeight = logicalHeight - paddingTop - paddingBottom;


  //PADDING
  static const EdgeInsets extraSmallPadding =  EdgeInsets.all(4.0);
  static const EdgeInsets smallPadding = EdgeInsets.all( 8.0);
  static const EdgeInsets mediumPadding =  EdgeInsets.all(16.0);
  static const EdgeInsets largePadding =  EdgeInsets.all(24.0);
  static const EdgeInsets extraLargePadding =  EdgeInsets.all(32.0);

  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets horizontalPadding =  EdgeInsets.all(16.0);
  static const EdgeInsets verticalPadding = EdgeInsets.all(8.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(12.0);
  static const EdgeInsets listItemPadding = EdgeInsets.all(12.0);
  static const EdgeInsets iconPadding = EdgeInsets.all(8.0);
  static const EdgeInsets buttonPadding = EdgeInsets.all(8.0);
  static const EdgeInsets inputPadding = EdgeInsets.all(16.0);
  static const EdgeInsets appBarTitlePadding = EdgeInsets.all(16.0);
  static const EdgeInsets sectionPadding =EdgeInsets.all( 16.0);
  static const EdgeInsets dividerPadding = EdgeInsets.all(16.0);

  static SizedBox sizedBoxTiny = const SizedBox(
    height: 5,
  );
  static SizedBox sizedBoxSmall = const SizedBox(
    height: 10,
  );
  static SizedBox sizedBoxMedium = const SizedBox(
    height: 15,
  );
  static SizedBox sizedBoxLarge = const SizedBox(
    height: 20,
  );
  static SizedBox sizedBoxExtraLarge = const SizedBox(
    height: 30,
  );

  static SizedBox sizedBoxHorizontalTiny = const SizedBox(
    width: 5,
  );
  static SizedBox sizedBoxHorizontalSmall = const SizedBox(
    width: 10,
  );
  static SizedBox sizedBoxHorizontalMedium = const SizedBox(
    width: 15,
  );
  static SizedBox sizedBoxHorizontalLarge = const SizedBox(
    width: 20,
  );

  static Divider dividerTiny = const Divider(
    thickness: .25,
  );
  static Divider dividerSmall = const Divider(
    thickness: .5,
  );
  static Divider dividerMedium = const Divider(
    thickness: 1,
  );
  static Divider dividerLarge = const Divider(
    thickness: 1.5,
  );

  static Border borderTiny = Border.all(color: Colors.grey, width: 0.2);
  static Border borderSmall = Border.all(color: Colors.grey, width: 0.5);
  static Border borderMedium = Border.all(color: Colors.grey, width: 1);
  static Border borderLarge = Border.all(color: Colors.black, width: 1);

  static ButtonStyle buttonStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(window.physicalSize.width, 42)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      )));

  static ButtonStyle buttonStyleSmall = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.0),
  )));
  static ButtonStyle inActiveButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.grey),
      minimumSize: MaterialStateProperty.all(Size(window.physicalSize.width, 42)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      )));
  static ButtonStyle buttonStyleOutlined = ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.textDark),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(width: 1, color: AppColors.textDark.withOpacity(.8)),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      )));

  static List<BoxShadow> appDropShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 4), // changes position of shadow
    ),
  ];
  static List<BoxShadow> appDropSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(.20),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ];
  static List<BoxShadow> appDropTiny = [
    BoxShadow(
      color: Colors.black.withOpacity(.10),
      spreadRadius: 0,
      blurRadius: 1,
      offset: const Offset(0, 1), // changes position of shadow
    ),
  ];

  LinearGradient appLinearGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.4, 0.9],
      colors: [
        Theme.of(MyApp.navigatorKey.currentContext!)
            .colorScheme
            .primary
            .withOpacity(.3),
        Theme.of(MyApp.navigatorKey.currentContext!)
            .colorScheme
            .primary
            .withOpacity(.05),
      ],
    );
  }

  LinearGradient appLinearGradientSmall() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.5, 0.9],
      colors: [
        Theme.of(MyApp.navigatorKey.currentContext!)
            .colorScheme
            .primary
            .withOpacity(.3),
        Theme.of(MyApp.navigatorKey.currentContext!)
            .colorScheme
            .primary
            .withOpacity(.05),
      ],
    );
  }

  static BoxDecoration appBoxDecorationSmall8 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(8),
    boxShadow: appDropSmall,
  );
  static BoxDecoration appBoxDecorationSmall16 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(16),
    boxShadow: appDropSmall,
  );
  static BoxDecoration appBoxDecorationSmall32 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(32),
    boxShadow: appDropSmall,
  );
  static BoxDecoration appBoxDecorationMedium4 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(4),
    boxShadow: appDropSmall,
  );

  static BoxDecoration appBoxDecorationMedium8 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(8),
    boxShadow: appDropSmall,
  );
  static BoxDecoration appBoxDecorationMedium16 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(16),
    boxShadow: appDropShadow,
  );
  static BoxDecoration appBoxDecorationMedium32 = BoxDecoration(
    color: Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.surface,
    borderRadius: BorderRadius.circular(32),
    boxShadow: appDropShadow,
  );
}

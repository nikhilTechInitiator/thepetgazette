import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:thepetgazette/constants/app_themes.dart';
import 'package:thepetgazette/presentation/screens/authentication/authentication_provider.dart';
import 'package:thepetgazette/presentation/screens/authentication/splash_screen.dart';
import 'package:thepetgazette/router/app_router.dart';
import 'package:thepetgazette/utils/firebase_local_noitification_utils.dart';

import 'firebase_options.dart';
import 'presentation/screens/home.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission(
        sound: true, badge: true, alert: true, provisional: false);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),

      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        navigatorKey: MyApp.navigatorKey,
        theme: getTheme(),
        useInheritedMediaQuery: true,
        // home:  Home(),
        home:  SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:thepetgazette/presentation/screens/downloads/downloads.dart';
import 'package:thepetgazette/presentation/screens/home.dart';

import '../presentation/screens/advertise_with_us/advertise_with_us.dart';
import '../presentation/screens/authentication/login.dart';
import '../presentation/screens/authentication/splash_screen.dart';
import '../presentation/screens/top_ten_pets/pet_profile.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map? args = settings.arguments as Map?;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/downloads':
        return MaterialPageRoute(builder: (_) => const Downloads());
      case '/advertiseWithUs':
        return MaterialPageRoute(builder: (_) => AdvertiseWithUs());
      case '/nationalEdition':
        return MaterialPageRoute(builder: (_) => const Downloads());
      case '/petProfile':
        return MaterialPageRoute(
            builder: (_) => PetProfile(
                  appBarTitle: args?['appBarTitle'] ?? '',
                ));
      case '/drivingProgressPage':
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              // appBar: appBarDefault(AppStrings.drivingProgress),
              body: Container()),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
              ),
              body: const Center(
                child: Text('The page not found'),
              ),
            ));
  }
}

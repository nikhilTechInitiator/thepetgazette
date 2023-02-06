import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/main.dart';
import 'package:thepetgazette/presentation/screens/featured_articles/featured_articles.dart';
import 'package:thepetgazette/presentation/screens/print_order/print_order.dart';
import 'package:thepetgazette/presentation/screens/tpg_tv/tpg_tv.dart';

import 'download_digital/download_digital.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const DownloadDigital(),
      PrintOrder(),
      const FeaturedArticle(),
      TPGTV(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppDrawables.downloadDigital),
        title: ("Download Digital "),
        iconSize: 48,
        contentPadding: 0,
        textStyle: const TextStyle(fontSize: 12),
        activeColorPrimary:
            Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppDrawables.printOrder),
        title: ("Print Order "),
        iconSize: 24,
        textStyle: TextStyle(fontSize: 12),
        activeColorPrimary:
            Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppDrawables.featuredArticle),
        iconSize: 24,
        textStyle: TextStyle(fontSize: 12),
        title: ("Featured Article "),
        activeColorPrimary:
            Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppDrawables.tpgTV),
        title: 'TPG TV ',
        iconSize: 24,
        textStyle: TextStyle(fontSize: 12),
        activeColorPrimary:
            Theme.of(MyApp.navigatorKey.currentContext!).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.

        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property.
      ),
    );
  }
}

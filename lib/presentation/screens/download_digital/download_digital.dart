import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/screens/download_digital/national_edition.dart';

import '../../components/app_bars/app_bar_home.dart';
import '../../drawers/home_drawer.dart';
import 'local_edition.dart';

class DownloadDigital extends StatelessWidget {
  const DownloadDigital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(),
      drawer: HomeDrawer(),
      body: Padding(
        padding: AppStyles.layoutMargin,
        child: Column(
          children: [
            Text(
                'For the first time ever, below you can download a digital version of our upcoming Winter issue, focuesed around health and wealness'),
            AppStyles.sizedBoxLarge,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        child: Image.asset(
                      AppDrawables.dummyPost,
                      fit: BoxFit.cover,
                    )),
                    AppStyles.sizedBoxLarge,
                    ElevatedButton(
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const LocalEdition(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text('Purchase Local Edition')),
                    ElevatedButton(
                        onPressed: () {
                         PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: NationalEdition(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text('Purchase National Edition'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

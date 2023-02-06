import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';
import 'package:thepetgazette/presentation/screens/download_digital/purchase_deatils.dart';

class LocalEdition extends StatelessWidget {
  const LocalEdition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Local Edition'),
      body: Padding(
        padding: AppStyles.layoutMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppStyles.sizedBoxMedium,
            const Text(
              'Please tap on below location based edition to begin your download.',
              textAlign: TextAlign.center,
            ),
            AppStyles.sizedBoxLarge,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    crossAxisSpacing: 0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const PurchaseDetails(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:7),
                          child: Card(
                            child: Image.asset(
                              AppDrawables.dummyDownload,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            AppStyles.sizedBoxMedium,
                            SvgPicture.asset(
                              AppDrawables.locked,
                              height: 24,
                              width: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

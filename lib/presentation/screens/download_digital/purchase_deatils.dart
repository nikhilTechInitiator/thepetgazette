import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';

class PurchaseDetails extends StatelessWidget {
  const PurchaseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Purchase'),
      body: Padding(
        padding: AppStyles.layoutMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: AppStyles.appBoxDecorationSmall8,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Current Issue - \S2.99'),
                  Radio(value: 0, groupValue: 1, onChanged: (value){

                  }),
                ],
              ),
            ),
            AppStyles.sizedBoxMedium,
            Container(
              decoration: AppStyles.appBoxDecorationSmall8,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Annual Subscription - \S12.99'),
                  Radio(value: 0, groupValue: 1, onChanged: (value){

                  }),
                ],
              ),
            ),
            AppStyles.sizedBoxExtraLarge,

            ElevatedButton(onPressed: (){}, child: Text('Purchase')),

          ],
        ),
      ),
    );
  }
}

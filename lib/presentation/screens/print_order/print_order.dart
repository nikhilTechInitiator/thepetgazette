import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/radio_switch/radio_text.dart';
import 'package:thepetgazette/presentation/components/text_fields/text_field_outlined.dart';

import '../../components/app_bars/app_bar_home.dart';
import '../../drawers/home_drawer.dart';

class PrintOrder extends StatelessWidget {
  PrintOrder({Key? key}) : super(key: key);

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: appBarHome(),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        padding: AppStyles.screenPadding,

        child: Column(
          children: [
            const Text(
                'if you are live in Westchester Country,NY,Fairfield Country, CT, New York City, NY or Long Island and would like to have issues of The Pet Gazette mailed to your home'),
            AppStyles.sizedBoxLarge,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  TextFieldOutlined(
                      label: 'Name', textEditingController: nameTextEditingController),
                  TextFieldOutlined(
                      label: 'Email', textEditingController: emailTextEditingController),
                  TextFieldOutlined(
                      minLines: 4,
                      label: 'Address',
                      textEditingController: addressTextEditingController),
                  AppStyles.sizedBoxSmall,
                  Text(
                    'For Which Edition You want to subscribe?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  AppStyles.sizedBoxTiny,
                  ListView(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      RadioText(text: 'New York City', isSelected: true, onChanged: (value){}),
                      RadioText(text: 'Fairfield County', isSelected: false, onChanged: (value){}),
                      RadioText(text: 'Long Island', isSelected: false, onChanged: (value){}),
                      RadioText(text: 'Westchester', isSelected: false, onChanged: (value){}),
                    ],
                  ),
                  AppStyles.sizedBoxSmall,
                  Text(
                    'For Which Edition You want to subscribe?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  AppStyles.sizedBoxTiny,
                  ListView(
                    shrinkWrap: true,

                    physics:const NeverScrollableScrollPhysics(),

                    children: [
                      RadioText(text: '\$2.99/month', isSelected: true, onChanged: (value){}),
                      RadioText(text: '\$9.99/year', isSelected: false, onChanged: (value){}),
                               ],
                  ),
                  AppStyles.sizedBoxExtraLarge,

                  ElevatedButton(onPressed: () {}, child: Text('SUBMIT')),
                  AppStyles.sizedBoxExtraLarge,

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

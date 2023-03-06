import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';
import 'package:thepetgazette/presentation/components/players/custome_video_player.dart';
import 'package:thepetgazette/presentation/screens/download_digital/purchase_deatils.dart';

import '../../components/app_bars/app_bar_home.dart';
import '../../components/text_fields/text_field_outlined.dart';
import '../../drawers/home_drawer.dart';

class TPGTV extends StatelessWidget {
   TPGTV({Key? key}) : super(key: key);

  final StreamController<String> videoControllerStream =   StreamController<String>.broadcast();
   TextEditingController emailTextEditingController = TextEditingController();
   TextEditingController addressTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        padding: AppStyles.screenPadding,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppStyles.sizedBoxExtraLarge,
            const Text(
              'The Pet Gazette TV is our inVet Office Channel featuring the latest viral pet videos. Click below to view some of the segments.',
              textAlign: TextAlign.center,
            ),
            AppStyles.sizedBoxLarge,
           CustomVideoPlayer(url: 'url', videoControllerStream: videoControllerStream),
             AppStyles.sizedBoxLarge,
             Text(
              'Leave a comment below',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            AppStyles.sizedBoxSmall,
            TextFieldOutlined(
                label: 'Email', textEditingController: emailTextEditingController),
            TextFieldOutlined(
                minLines: 4,
                label: 'Address',
                textEditingController: addressTextEditingController),
            AppStyles.sizedBoxExtraLarge,

            ElevatedButton(onPressed: () {}, child: Text('SUBMIT')),
            AppStyles.sizedBoxExtraLarge,
          ],
        ),
      ),
    );
  }
}

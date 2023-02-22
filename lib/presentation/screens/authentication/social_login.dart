import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:thepetgazette/constants/app_styles.dart';

import '../../components/popup_and_loaders/show_loader.dart';


class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
                child: Divider(
                  thickness: 1.5,
                )),
            Text(
              "  OR  ",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
            Expanded(
                child: Divider(
                  thickness: 1.5,
                )),
          ],
        ),
        AppStyles.sizedBoxSmall,

        SignInButton(
          Buttons.Google,
          padding: EdgeInsets.all(2),
          text: "Continue with Google",
          onPressed: () {
            // showLoader();
            // AuthService().signInWithGoogle().then((result) {
            //   if (result != null) {
            //     print(result);
            //     AuthService().socialLogin().then((value) {
            //       if (value=='new_user'|| value=='existing_user') {
            //         AuthService().handleAuthSuccess(parentPage: value=='new_user'?'social_login_new_user':'social_login_existing_user');
            //       } else {
            //         hideLoader();
            //       }
            //     });
            //   } else {
            //     hideLoader();
            //   }
            // });
          },
        ),
        AppStyles.sizedBoxSmall,
        SignInButton(
          Buttons.Facebook,
          padding: EdgeInsets.all(8),
          text: "Continue with Facebook",
          onPressed: () {
            // showLoader();
            // AuthService().signInWithFacebook().then((result) {
            //   if (result != null) {
            //     print(result);
            //     AuthService().socialLogin().then((value) {
            //       if (value=='new_user'|| value=='existing_user') {
            //         AuthService().handleAuthSuccess(parentPage: value=='new_user'?'social_login_new_user':'social_login_existing_user');
            //
            //       } else {
            //         hideLoader();
            //       }
            //     });
            //   } else {
            //     hideLoader();
            //   }
            // });
          },
        ),
        if (Platform.isIOS)
          AppStyles.sizedBoxSmall,
        if (Platform.isIOS)
          SignInButton(
            Buttons.Apple,
            padding:const  EdgeInsets.all(2),
            text: "Continue with Apple",
            onPressed: () {
              // showLoader();

              print('apple message 0');

              // AuthService().signInWithApple().then((result) {
              //   print('apple message 5');
              //
              //   if (result != null) {
              //     print(result);
              //     print('apple message 6');
              //
              //     AuthService().socialLogin().then((value) {
              //       print('apple message 7');
              //
              //       if (value=='new_user'|| value=='existing_user') {
              //         print('apple message 8');
              //
              //         AuthService().handleAuthSuccess(parentPage: value=='new_user'?'social_login_new_user':'social_login_existing_user');
              //
              //       } else {
              //         print('apple message 9');
              //
              //         hideLoader();
              //       }
              //     });
              //   } else {
              //     print('apple message 10');
              //
              //     hideLoader();
              //   }
              // });
            },
          ),
      ],
    );
  }
}



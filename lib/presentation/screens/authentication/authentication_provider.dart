import 'dart:async';

import 'package:thepetgazette/constants/app_enums.dart';
import 'package:thepetgazette/constants/app_exceptions.dart';

import 'package:thepetgazette/utils/firebase_local_noitification_utils.dart';
import 'package:thepetgazette/utils/http_api_client.dart';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.initial;
  SharedPreferences? sharedPreferences;


  UserModel userModel=UserModel();

  autoLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();

    debugPrint(
        'Auth token from share preference => ${sharedPreferences!.getString('auth_token')}');
    if (sharedPreferences!.getString('auth_token') != null) {
      try {
        var response = await loginHttpRequest(
            urlAddress: 'rest/re_login',
            requestBody: {},
            httpMethod: HttpMethod.post,
            isShowLoader: false,
            isShowSnackBar: false);

        if (response != null &&
            response['user'] != null &&
            response['branding_info'] != null &&
            response['state_list'] != null &&
            response['notify_types'] != null) {
          authenticationSuccess(response);
        } else {
          throw AppExceptions.somethingWentWrong;
        }
      } catch (e) {
        authStatus = AuthStatus.unAuthenticated;
      }
    } else {
      authStatus = AuthStatus.unAuthenticated;
    }
  }

  login({required String email, required String password}) async {
    authStatus = AuthStatus.authenticating;

    String? firebaseMessageToken;
    try {
      firebaseMessageToken = await getFirebaseMessagingToken();
    } catch (e) {
      debugPrint('firebase token issue');
    }
    try {
      var response = await loginHttpRequest(
          urlAddress: 'login',
          requestBody: {
            'email': email,
            'password': password,
            'firebase_token': firebaseMessageToken ?? ''
          },
          isShowLoader: false,
          isShowSnackBar: true,
          httpMethod: HttpMethod.post);
      if (response != null &&
          response['authorisation'] != null &&
          response['user'] != null &&
          response['branding_info'] != null &&
          response['state_list'] != null &&
          response['notify_types'] != null) {

          sharedPreferences!
              .setString('auth_token', response['authorisation']['token']);
          authToken = response['authorisation']['token'];
          authenticationSuccess(response);

      } else {
        throw AppExceptions.somethingWentWrong;
      }
    } catch (e) {
      authStatus = AuthStatus.authenticationFailed;
    }
  }

  logOut() async {
    try {
      String? firebaseMessageToken;
      try {
        firebaseMessageToken = await getFirebaseMessagingToken();
      } catch (e) {
        debugPrint('firebase token issue');
      }
      var response = await loginHttpRequest(
          urlAddress: 'logout',
          requestBody: {'firebase_token': firebaseMessageToken ?? ''},
          httpMethod: HttpMethod.post,
          isShowLoader: true,
          isShowSnackBar: true);

      if (response != null && response['status'] == 'success') {
        sharedPreferences!.clear();
        authStatus = AuthStatus.unAuthenticated;
      } else {
        throw AppExceptions.somethingWentWrong;
      }
    } catch (e) {
      authStatus = AuthStatus.authenticated;
    }
  }

  authenticationSuccess(var response) async {


    authStatus = AuthStatus.authenticated;
  }
}

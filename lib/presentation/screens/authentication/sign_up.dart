import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';
import 'package:thepetgazette/presentation/components/text_fields/basic_text_field.dart';
import 'package:thepetgazette/presentation/screens/authentication/social_login.dart';

import '../../../constants/app_drawables.dart';
import '../../../constants/app_styles.dart';
import '../../components/text_fields/text_field_outlined.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();


  final _formKey =  GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(automaticallyImplyLeading: true,),
      body: _formWidget()
    );
  }

  Widget _formWidget() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: AppStyles.screenPadding,
        child: Center(
          heightFactor:1.3 ,
          child: Card(
            color: Colors.white,

            child: SingleChildScrollView(

              padding:
              AppStyles.screenPadding.copyWith(top: AppStyles().paddingTop),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  AppStyles.sizedBoxMedium,
                  BasicTextField(
                    label: 'Name',
                    prefixIconLocation: AppDrawables.person,
                    textEditingController: nameTextEditingController,
                    validator: (val) {
                      if (val == null ||
                          val.isEmpty) {
                        return 'Please fill';
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress,
                  ),  BasicTextField(
                    label: 'Email',
                    prefixIconLocation: AppDrawables.email,
                    textEditingController: emailTextEditingController,
                    validator: (val) {
                      if (val == null ||
                          val.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  BasicTextField(
                    label: 'Password',
                    textEditingController: passwordTextEditingController,
                    prefixIconLocation: AppDrawables.password,
                    isPassword: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please fill';
                      } else if (val.length < 6) {
                        return "Password length should be Greater than 6";
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                  ),
                  BasicTextField(
                    label: 'Confirm Password',
                    textEditingController: confirmPasswordTextEditingController,
                    prefixIconLocation: AppDrawables.password,
                    isPassword: true,

                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please fill!';
                      } else if (val.length < 6) {
                        return "Password length should be Greater than 6";
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                  ),

                  AppStyles.sizedBoxLarge,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "SIGN UP",
                    ),
                  ),
                  const SocialLoginWidget(),
                  AppStyles.sizedBoxExtraLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Log In"
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

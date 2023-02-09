import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/text_fields/basic_text_field.dart';
import 'package:thepetgazette/presentation/screens/authentication/sign_up.dart';
import 'package:thepetgazette/presentation/screens/authentication/social_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(automaticallyImplyLeading: true,),
        body: _formWidget());
  }

  Widget _formWidget() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: AppStyles.layoutMargin,
        child: Center(
          heightFactor:1.3 ,
          child: Card(
            color: Colors.white,
            
            child: SingleChildScrollView(
              
              padding:
                  AppStyles.layoutMargin.copyWith(top: AppStyles().paddingTop),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Log In',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  AppStyles.sizedBoxMedium,
                  BasicTextField(
                    label: 'Email',
                    prefixIconLocation: AppDrawables.email,
                    textEditingController: emailTextEditingController,
                    validator: (val) {
                      if (val == null ||
                          val.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  BasicTextField(
                    label: 'Password',
                    textEditingController: passwordTextEditingController,
                    prefixIconLocation: AppDrawables.password,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please fill';
                      } else if (val.length < 6) {
                        return "Password length should be Greater than 6";
                      }
                      return null;
                    },
                    isPassword: true,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  AppStyles.sizedBoxLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {

                        },
                        child: Text(
                          "Forget Password?",
                          style: GoogleFonts.raleway(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppStyles.sizedBoxLarge,
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      // }
                    },
                    child: const Text(
                      "LOG IN",
                    ),
                  ),
                  const SocialLoginWidget(),
                  AppStyles.sizedBoxExtraLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUp(),
                              ));
                        },
                        child: const Text(
                          "Sign Up",
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

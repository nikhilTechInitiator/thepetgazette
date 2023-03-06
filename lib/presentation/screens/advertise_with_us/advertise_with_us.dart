import 'package:flutter/material.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';
import 'package:thepetgazette/presentation/components/text_fields/text_field_outlined.dart';

import '../../../constants/app_styles.dart';
import '../../components/radio_switch/check_box_text.dart';

class AdvertiseWithUs extends StatelessWidget {
  AdvertiseWithUs({Key? key}) : super(key: key);
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController companyNameTextEditingController =
      TextEditingController();
  TextEditingController subjectTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Advertise With US'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: AppStyles.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldOutlined(
                label: 'Name',
                textEditingController: nameTextEditingController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill';
                  }
                  return null;
                },
                textInputType: TextInputType.text,
              ),
              TextFieldOutlined(
                label: 'Email',
                textEditingController: emailTextEditingController,
                validator: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val)) {
                    return 'Please fill';
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
              ),
              TextFieldOutlined(
                label: 'Phone',
                textEditingController: emailTextEditingController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill';
                  }
                  return null;
                },
                maxLength: 10,
                textInputType: TextInputType.phone,
              ),
              TextFieldOutlined(
                label: 'Company Name',
                textEditingController: companyNameTextEditingController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill';
                  }
                  return null;
                },
                maxLength: 10,
                textInputType: TextInputType.text,
              ),
              Text('Edition '),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  CheckBoxText(text: 'New York City',isSelected: false, onChanged: (value){},),
                  CheckBoxText(text: 'Fairfield City',isSelected: false, onChanged: (value){},),
                  CheckBoxText(text: 'Westchester',isSelected: false, onChanged: (value){},),
                  CheckBoxText(text: 'Long Island',isSelected: false, onChanged: (value){},),
                ],
              ),
              AppStyles.sizedBoxLarge,
              TextFieldOutlined(
                label: 'Subject',
                textEditingController: subjectTextEditingController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill';
                  }
                  return null;
                },
                maxLength: 10,
                textInputType: TextInputType.text,
              ),
              TextFieldOutlined(
                label: 'Message',
                textEditingController: messageTextEditingController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please fill';
                  }
                  return null;
                },
                maxLength: 10,
                minLines: 10,
                maxLines: 1000,
                textInputType: TextInputType.text,
              ),
              AppStyles.sizedBoxExtraLarge,
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

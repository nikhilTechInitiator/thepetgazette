import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';

class CheckBoxText extends StatelessWidget {
  const CheckBoxText({Key? key,required this.text,required this.isSelected,required this.onChanged}) : super(key: key);

  final String text;
  final bool isSelected;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height:24,width:24,child: Checkbox(value: isSelected,onChanged:(value)=> onChanged(value))),
        AppStyles.sizedBoxHorizontalSmall,
        Text(text),
        AppStyles.sizedBoxHorizontalMedium,

      ],
    );
  }
}

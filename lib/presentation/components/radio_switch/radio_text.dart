import 'package:flutter/material.dart';

class RadioText extends StatelessWidget {
  const RadioText({Key? key,required this.text,required this.isSelected,required this.onChanged}) : super(key: key);

  final String text;
  final bool isSelected;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        SizedBox(height:32,child: Radio(value: isSelected?1:0, groupValue: 1, onChanged:(value)=> onChanged(value))),
        Text(text),
      ],
    );
  }
}

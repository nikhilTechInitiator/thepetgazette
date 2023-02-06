import 'package:thepetgazette/constants/app_styles.dart';
import 'package:flutter/material.dart';

class BasicDropDown extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final Decoration? style;
  final String? label;
  final Function callback;
  final FormFieldValidator<String>? validator;

  const BasicDropDown(
      {Key? key,
      required this.items,
      this.selectedItem,
      required this.callback,
      this.validator,
      this.style,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
      margin: const EdgeInsets.all(1),
      decoration: style ?? AppStyles.appBoxDecorationSmall8,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          hint: Text(label ?? ""),
          value: selectedItem,
          isExpanded: true,
          elevation: 1,
          decoration: const InputDecoration(border: InputBorder.none),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (value) {
            callback(value);
          },
        ),
      ),
    );
  }
}

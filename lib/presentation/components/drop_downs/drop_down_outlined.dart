import 'package:flutter/material.dart';

class DropDownOutlined extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String? label;
  final Function callback;
  final FormFieldValidator<String>? validator;
  final bool? isRequiredField;
  final Color? color;
  final bool? autoValidate;

  const DropDownOutlined(
      {Key? key,
      required this.items,
      required this.selectedItem,
      this.validator,
      required this.callback,
      this.label,
      this.color,
      this.isRequiredField,
      this.autoValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color ?? Colors.black.withOpacity(.8))),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          hint: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: label,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
                children: [
                  if (isRequiredField ?? false)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                          // color: Theme.of(context).colorScheme.,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                ]),
          ),
          value: selectedItem,
          isExpanded: true,
          elevation: 1,
          validator: validator,
          autovalidateMode: autoValidate == true
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(border: InputBorder.none),
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

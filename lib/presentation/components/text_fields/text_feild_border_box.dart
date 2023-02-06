import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldBoxBorder extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter> inputFormatters;
  final bool isRequiredField;

  const TextFieldBoxBorder({
    Key? key,
    required this.textEditingController,
    this.textInputType,
    this.validator,
    this.isRequiredField = true,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 1,
      controller: textEditingController,
      validator: validator,
      enableSuggestions: true,
      autocorrect: true,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
        constraints: const BoxConstraints(minWidth: 50, maxWidth: 200),
        contentPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 2),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(.5), width: .5),
        ),
        errorMaxLines: 1,
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error.withOpacity(.7)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error.withOpacity(.7)),
        ),
      ),
    );
  }
}

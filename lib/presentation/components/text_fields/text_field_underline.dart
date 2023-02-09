import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldUnderlined extends StatelessWidget {
  final String? hint;
  final int? minLines, maxLines;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final String? prefixIconLocation;
  final List<TextInputFormatter> inputFormatters;
  final String label;
  final bool isRequiredField;
  final String? suffixText;
  final Color? errorBorderColor;
  final bool? autoValidate;
  final bool? isReadOnly;

  const TextFieldUnderlined({
    Key? key,
    this.hint,
    required this.label,
    this.prefixIconLocation,
    required this.textEditingController,
    this.minLines,
    this.maxLines,
    this.textInputType,
    this.validator,
    this.isRequiredField = true,
    this.suffixText,
    this.inputFormatters = const [],
    this.errorBorderColor,
    this.autoValidate,
    this.isReadOnly,
  }) : super(key: key);

  // final FocusNode _focusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        readOnly: isReadOnly == true ? true : false,
        minLines: minLines,
        maxLines: maxLines,
        controller: textEditingController,
        // focusNode: _focusNode,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
        validator: validator,
        enableSuggestions: true,
        autocorrect: true,
        inputFormatters: inputFormatters,
        cursorHeight: 18,
        autovalidateMode: autoValidate == true
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        decoration: InputDecoration(
          counterText: '',
          // hintText: hint ?? label,
          alignLabelWithHint: true,
          errorStyle: TextStyle(fontSize: errorBorderColor != null ? 0 : 14),
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.normal),
          hintText: textEditingController.text.isEmpty
              ? label
              : textEditingController.text,
          suffixText: suffixText,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 12, vertical: errorBorderColor != null ? 4 : 8),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black, width: 2)),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: errorBorderColor ?? Colors.black, width: 2),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: errorBorderColor ?? Colors.black, width: 2),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}

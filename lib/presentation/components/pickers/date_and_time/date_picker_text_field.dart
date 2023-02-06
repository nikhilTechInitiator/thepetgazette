import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thepetgazette/constants/app_strings.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/main.dart';

class DatePickerTextField extends StatelessWidget {
  DateTime? dateTime;

  final String? hint;
  final double? horizontalContentPadding;
  final FormFieldValidator<String>? validator;
  final String? label;
  final DateTime? firstDate, lastDate, initialDate;
  final bool isRequired;
  final bool isShowBorderAndOutlinedLabel;
  final Function? onDateSelected;
  final Color? borderColor;

  // final FocusNode _focusNode=FocusNode();

  DatePickerTextField(
      {Key? key,
      this.hint,
      this.label,
      this.firstDate,
      this.lastDate,
      this.dateTime,
      this.validator,
      this.isRequired = true,
      this.onDateSelected,
      this.isShowBorderAndOutlinedLabel = true,
      this.horizontalContentPadding,
      this.borderColor,
      this.initialDate})
      : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (dateTime != null) {
      textEditingController.text = DateFormat('MM/dd/yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
    return Column(
      children: [
        if (label != null && !isShowBorderAndOutlinedLabel)
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: label!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ],
            ),
          ),
        if (label != null && !isShowBorderAndOutlinedLabel)
          AppStyles.sizedBoxTiny,
        TextFormField(
          controller: textEditingController,
          minLines: 1,
          maxLines: 1,
          // focusNode: _focusNode,
          style: Theme.of(context).textTheme.bodyMedium,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
              (value) =>
                  isRequired && dateTime == null ? AppStrings.pleaseFill : null,
          enableSuggestions: true,
          autocorrect: true,
          enableInteractiveSelection: false,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            pickDate();
          },
          decoration: InputDecoration(
            counterText: '',
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            alignLabelWithHint: true,
            label: isShowBorderAndOutlinedLabel
                ? RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  )
                : null,
            suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_month_sharp),
                onPressed: () async {
                  pickDate();
                }),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalContentPadding ?? 12, vertical: 12),
            border: isShowBorderAndOutlinedLabel
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: borderColor ?? Colors.black.withOpacity(.5)),
                  )
                : InputBorder.none,
            errorBorder: isShowBorderAndOutlinedLabel
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: borderColor ?? Colors.black.withOpacity(.5)),
                  )
                : InputBorder.none,
          ),
        ),
      ],
    );
  }

  pickDate() async {
    dateTime = await showDatePicker(
        initialDate: initialDate ?? DateTime.now(),
        context: MyApp.navigatorKey.currentContext!,
        firstDate: firstDate ?? DateTime(2020),
        lastDate: lastDate ?? DateTime(2050));
    if (dateTime != null) {
      onDateSelected?.call(dateTime);

      textEditingController.text = DateFormat('MM/dd/yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }
}

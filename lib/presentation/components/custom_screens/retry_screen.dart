import 'package:thepetgazette/constants/app_colors.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class RetryScreen extends StatelessWidget {
  const RetryScreen(
      {Key? key,
      this.message = 'Something Went Wrong',
      required this.retryAction})
      : super(key: key);

  final String message;
  final Function retryAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/retry_page_icon.svg',
            width: AppStyles().width * .5,
          ),
          AppStyles.sizedBoxLarge,
          Text('Something went Wrong',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.textDark.withOpacity(.6))),
          AppStyles.sizedBoxLarge,
          ElevatedButton(
              onPressed: () {
                retryAction();
              },
              child: const Text('Retry')),
          AppStyles.sizedBoxLarge,
          AppStyles.sizedBoxLarge,
          AppStyles.sizedBoxLarge,
        ],
      ),
    );
  }
}

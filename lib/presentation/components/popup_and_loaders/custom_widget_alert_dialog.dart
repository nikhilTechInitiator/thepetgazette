import 'package:thepetgazette/constants/app_styles.dart';

import '../../../main.dart';
import 'package:flutter/material.dart';


customWidgetAlertDialog(Widget child,
    {EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
    bool isCloseIconVisible = false}) async {
  await showDialog(
      context: MyApp.navigatorKey.currentContext!,
      useSafeArea: false,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            titlePadding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: contentPadding ,
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            actionsPadding: const EdgeInsets.all(0),
            backgroundColor: Theme.of(context).colorScheme.surface,
            content: SizedBox(
              width: AppStyles().width,
              child: isCloseIconVisible
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, bottom: 10, right: 4),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.clear)),
                            ],
                          ),
                          child,
                        ],
                      ),
                    )
                  : child,
            ),
          ));
}

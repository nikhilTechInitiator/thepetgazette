import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_drawables.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Downloads'),
      body: Padding(
        padding: AppStyles.layoutMargin,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio:.75
                ),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: AppStyles.appDropTiny,
                        color: Theme.of(context).colorScheme.surface),
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(AppDrawables.dummyDownload,fit: BoxFit.cover)),
                        Center(
                            child: Text(
                          'Winter Article',
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppStyles.sizedBoxLarge,
            ElevatedButton(onPressed: (){}, child: const Text('Restore'))
          ],
        ),
      ),
    );
  }
}

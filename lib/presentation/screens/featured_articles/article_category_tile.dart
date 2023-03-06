import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';

import 'article_tile.dart';

class ArticleCategoryTile extends StatelessWidget {
  const ArticleCategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Center(child: Text('Winter Article',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold),)),
        ),
        Flexible(
          child: ListView.separated(
            itemCount: 2,
            physics:const NeverScrollableScrollPhysics(),
            padding: AppStyles.screenPadding,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const ArticleTile();
            }, separatorBuilder: (BuildContext context, int index) {
              return AppStyles.sizedBoxSmall;
          },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/screens/featured_articles/article_category_tile.dart';

import '../../components/app_bars/app_bar_home.dart';
import '../../drawers/home_drawer.dart';

class FeaturedArticle extends StatelessWidget {
  const FeaturedArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(),
      drawer: HomeDrawer(),
      body: ListView.separated(
        itemCount: 2,
        padding: EdgeInsets.symmetric(vertical: 20),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const ArticleCategoryTile();
        }, separatorBuilder: (BuildContext context, int index) {
        return AppStyles.sizedBoxLarge;

      },
      ),
    );
  }
}

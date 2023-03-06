import 'package:flutter/material.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/components/app_bars/app_bar_default.dart';

import 'pet_profile_tile.dart';

class TopTenPets extends StatelessWidget {
  const TopTenPets({Key? key, required this.petCategory}) : super(key: key);

  final String petCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault('Top Ten $petCategory'),
      body: ListView.separated(
          padding: AppStyles.screenPadding,
          itemCount: 10,
          itemBuilder: (context, index) => const PetProfileTile(), separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12,);
      },),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_drawables.dart';
import '../../../constants/app_styles.dart';
import '../../../utils/url_laucher.dart';
import '../../components/app_bars/app_bar_default.dart';
import '../../components/popup_and_loaders/custom_circular_progress_indicator.dart';

class PetProfile extends StatelessWidget {
  const PetProfile({Key? key,required this.appBarTitle}) : super(key: key);

 final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    final double imageSize = AppStyles().logicalWidth * .3;

    return Scaffold(
      appBar: appBarDefault(appBarTitle),
      body: SingleChildScrollView(
        padding: AppStyles.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                height: imageSize,
                width: imageSize,
                imageUrl:
                    'https://images.saymedia-content.com/.image/t_share/MTc0MTg5MjY2MDczODIyNzE2/why-pugs-dogs-are-the-perfect-family-pet.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CustomCircularProgressIndicator(),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  AppDrawables.dummyPetProfileImage,
                  height: imageSize,
                  width: imageSize,
                ),
              ),
            ),
            Text(
              'The Official Grumpy Cat',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Grumpy Cat became an internet sensation after her photo was posted on Reddit on September 22, 2012 She is known for her permanently “grumpy” facial appearance, which is caused by an underbite and feline dwarfism',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            AppStyles.sizedBoxMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialProfileWidget(
                    iconLocation: AppDrawables.facebook, redirectLink: ''),
                _socialProfileWidget(
                    iconLocation: AppDrawables.instagram, redirectLink: ''),
                _socialProfileWidget(
                    iconLocation: AppDrawables.facebook, redirectLink: ''),
                _socialProfileWidget(
                    iconLocation: AppDrawables.youtube, redirectLink: ''),
              ],
            ),
            AppStyles.sizedBoxMedium,

            GridView.builder(
              shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl:
                        'https://images.saymedia-content.com/.image/t_share/MTc0MTg5MjY2MDczODIyNzE2/why-pugs-dogs-are-the-perfect-family-pet.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CustomCircularProgressIndicator(),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      AppDrawables.dummyPetProfileImage,
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: 10)
          ],
        ),
      ),
    );
  }

  _socialProfileWidget(
      {required String redirectLink, required String iconLocation}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SvgPicture.asset(
          iconLocation,
          height: 26,
          width: 26,
          color: Colors.black,
        ),
      ),
      onTap: () {
        UrlUtils().launch(redirectLink);
      },
    );
  }
}

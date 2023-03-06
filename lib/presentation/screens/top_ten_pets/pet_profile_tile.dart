import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thepetgazette/utils/url_laucher.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_drawables.dart';
import '../../../constants/app_styles.dart';
import '../../components/popup_and_loaders/custom_circular_progress_indicator.dart';

class PetProfileTile extends StatelessWidget {
  const PetProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageSize = AppStyles().logicalWidth * .25;

    return Container(
      padding: AppStyles.listItemPadding.copyWith(bottom: 0),
      decoration: AppStyles.appBoxDecorationMedium8,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
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
              AppStyles.sizedBoxHorizontalSmall,
              Expanded(
                child: SizedBox(
                  height: imageSize,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Official Grumpy Cat',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          'Grumpy Cat became an internet sensation after her photo was posted on Reddit on September 22, 2012 She is known for her permanently “grumpy” facial appearance, which is caused by an underbite and feline dwarfism',
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.fade,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/petProfile');
                  },
                  child: const Text(
                    'Read more >',
                    style: TextStyle(color: AppColors.textDark, fontSize: 13),
                  ))
            ],
          )
        ],
      ),
    );
  }

  _socialProfileWidget(
      {required String redirectLink, required String iconLocation}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: SvgPicture.asset(
          iconLocation,
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ),
      onTap: () {
        UrlUtils().launch(redirectLink);
      },
    );
  }
}

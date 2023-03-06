import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:thepetgazette/constants/app_strings.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/presentation/screens/advertise_with_us/advertise_with_us.dart';
import 'package:thepetgazette/presentation/screens/downloads/downloads.dart';

import '../../constants/app_drawables.dart';
import '../components/popup_and_loaders/custom_circular_progress_indicator.dart';
import '../screens/authentication/authentication_provider.dart';
import '../screens/top_ten_pets/top_ten_pets.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedPage = '';

  double leadingSize = 52;

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return Drawer(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          SizedBox(height: AppStyles().paddingTop),
          ListTile(
            leading: ClipOval(
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: SizedBox(
                  height: leadingSize,
                  width: leadingSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (authProvider.userModel.profileImages != null)
                        CachedNetworkImage(
                          imageUrl: authProvider.userModel.profileImages!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CustomCircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                            size: 44,
                          ),
                        ),
                      if (authProvider.userModel.profileImages == null)
                        Icon(
                          Icons.person,
                          color: Colors.grey.shade400,
                          size: 44,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            title: Text(
              authProvider.userModel.name ?? 'Unknown User',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              authProvider.userModel.email ?? 'unknown_user@email.com',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          // AppStyles.sizedBoxSmall,
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AppStyles.dividerMedium,
          ),

          _listTile(
              iconLocation: AppDrawables.aboutUs,
              name: 'Top Ten Dogs',
              clickAction: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen:  const TopTenPets(petCategory: 'Dog',),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          _listTile(
              iconLocation: AppDrawables.aboutUs,
              name: 'Top Ten Cats',
              clickAction: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen:  const TopTenPets(petCategory: 'Dog',),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          _listTile(
              iconLocation: AppDrawables.aboutUs,
              name: 'About US',
              clickAction: () {}),
          _listTile(
              iconLocation: AppDrawables.star,
              name: 'Rate US',
              clickAction: () {}),
          _listTile(
              iconLocation: AppDrawables.contactUs,
              name: 'Contact US',
              clickAction: () {}),
          _listTile(
              iconLocation: AppDrawables.advertise,
              name: 'Advertise',
              clickAction: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen:  AdvertiseWithUs(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),
          _listTile(
              iconLocation: AppDrawables.scanCode,
              name: 'QR Scan',
              clickAction: () {}),
          _listTile(
              iconLocation: AppDrawables.download,
              name: 'Download',
              clickAction: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const Downloads(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              }),

          Spacer(),
          ListTile(
            leading: SizedBox(
              height: leadingSize,
              width: leadingSize,
              child: Center(
                child: Icon(
                  Icons.logout,
                  size: 22,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            title: Text(AppStrings.logout,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .apply(color: Theme.of(context).colorScheme.onPrimary)),
            onTap: () => {
              showAlertDialog(context),
            },
          ),
          AppStyles.sizedBoxLarge,
        ],
      ),
    );
  }

  Widget _listTile(
      {required String iconLocation,
      required String name,
      required Function clickAction}) {
    return SizedBox(
      // color: Colors.red,
      // constraints: BoxConstraints(
      //     minHeight: Get.height * .048, maxHeight: 100),
      // height: AppStyles().height * .052,
      child: Center(
        child: ListTile(
          minVerticalPadding: 0,
          leading: SizedBox(
            height: leadingSize,
            width: leadingSize,
            child: Center(
              child: SvgPicture.asset(
                iconLocation,
                height: 22,
                width: 22,
                fit: BoxFit.scaleDown,
                color: _getColorOfTile(name),
              ),
            ),
          ),
          title: Text(name, style: _getTextStyle(name)),
          onTap: () => {_changeSelectedPage(name), clickAction()},
        ),
      ),
    );
  }

  _changeSelectedPage(String selectedPage) {
    setState(() {
      this.selectedPage = selectedPage;
    });
  }

  Color _getColorOfTile(String pageName) {
    return selectedPage == pageName
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onPrimary.withOpacity(.8);
  }

  TextStyle _getTextStyle(String pageName) {
    return selectedPage == pageName
        ? Theme.of(context).textTheme.button!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600)
        : Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Logout"),
    onPressed: () {
      Navigator.pop(context);
      Provider.of<AuthenticationProvider>(context, listen: false).logOut();
    },
  );
  AlertDialog alert = AlertDialog(
    // insetPadding: EdgeInsets.zero,

    content: SizedBox(
        width: AppStyles().width,
        child: const Text("Are you sure want to logout?")),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

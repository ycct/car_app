import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';

import 'drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xFF219DF8),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingDefaultWidth,
            vertical: context.paddingLargeHeight,
          ),
          children: <Widget>[
            context.sizedBoxHeightExtraSmall,
            buildHeader(
              context,
              urlImage: AppConstants.profilePhotoUrl,
              name: AppConstants.janeDoe,
              location: "UAE, DUBAI",
            ),
            context.sizedBoxHeightSmall,
            const Divider(
              thickness: 1,
            ),
            buildMenuItem(context,
                icon: Icons.person, title: AppConstants.profile),
            buildMenuItem(context,
                icon: Icons.home, title: AppConstants.home),
            buildMenuItem(context,
                icon: Icons.local_offer, title: AppConstants.offers),
            buildMenuItem(context,
                icon: Icons.shopping_basket_rounded,
                title: AppConstants.myProducts),
            buildMenuItem(context,
                icon: Icons.autorenew, title: AppConstants.remainingDeals),
            buildMenuItem(context,
                icon: Icons.settings, title: AppConstants.settings),
            buildMenuItem(context,
                icon: Icons.logout, title: AppConstants.signOut),
            buildMenuItem(context,
                icon: Icons.favorite,
                title: AppConstants.joinTheApp),
            context.sizedBoxHeightDefault,
            context.sizedBoxHeightSmall,
            buildRow()
          ],
        ),
      ),
    );
  }



  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(ImagePaths.facebookDrawerIcon),
        const SizedBox(width: 25),
        SvgPicture.asset(ImagePaths.instagramDrawerIcon),
        const SizedBox(width: 25),
        SvgPicture.asset(ImagePaths.twitterDrawerIcon),
      ],
    );
  }


  Widget buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    final defaultColor = Theme.of(context).disabledColor;
    return ListTile(
      leading: Icon(
        icon,
        color: defaultColor,
      ),
      title: Text(
        title,
        style: TextStyle(color: defaultColor),
      ),
      onTap: () {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xFF219DF8),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingDefaultWidth,
            vertical: context.paddingLargeHeight,
          ),
          children: <Widget>[
            context.sizedBoxHeightExtraSmall,
            buildHeader(context,
                urlImage: AppConstants.profilePhotoUrl,
                name: 'Jane Doe',
                location: "UAE, DUBAI"),
            context.sizedBoxHeightSmall,
            const Divider(
              thickness: 1,
              color: Colors.white,
            ),
            buildMenuItem(context, icon: Icons.person, title: 'PROFILE'),
            buildMenuItem(context, icon: Icons.home, title: 'HOME'),
            buildMenuItem(context, icon: Icons.settings, title: 'OFFERS'),
            buildMenuItem(context,
                icon: Icons.production_quantity_limits, title: 'MY PRODUCTS'),
            buildMenuItem(context,
                icon: Icons.autorenew, title: 'REMAINING DEALS'),
            buildMenuItem(context, icon: Icons.settings, title: 'SETTINGS'),
            buildMenuItem(context, icon: Icons.logout, title: 'SIGN OUT'),
            buildMenuItem(context,
                icon: Icons.favorite_border_outlined, title: 'JOIN THE APP'),
            context.sizedBoxHeightDefault,
            context.sizedBoxHeightSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: buildRow(),
            )
          ],
        ),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        SvgPicture.asset(ImagePaths.facebookDrawerIcon),
        const SizedBox(width: 25),
        SvgPicture.asset(ImagePaths.instagramDrawerIcon),
        const SizedBox(width: 25),
        SvgPicture.asset(ImagePaths.twitterDrawerIcon),
      ],
    );
  }


  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String location,
  }) {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(urlImage),
          ),
          context.sizedBoxWidthSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Theme.of(context).disabledColor),
              ),
              Text(
                location,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Theme.of(context).disabledColor),
              )
            ],
          )
        ],
      ),
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

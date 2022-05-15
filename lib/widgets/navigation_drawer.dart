import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/models/menu_model.dart';
import '../controller/bottom_bar_controller.dart';

class NavigationDrawer extends StatelessWidget {
  final String title;
  final String location;

  const NavigationDrawer(
      {Key? key, required this.title, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
                name: title,
                location: location.toUpperCase(),
              ),
              context.sizedBoxHeightSmall,
              const Divider(
                thickness: 1,
              ),
              ...allMenuList.map(
                (menu) => buildMenuItem(context,
                    title: menu.text, icon: menu.iconData, index: menu.index),
              ),
              context.sizedBoxHeightDefault,
              context.sizedBoxHeightSmall,
              buildRow(context)
            ],
          ),
        ),
      );
    });
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
            radius: 32,
            backgroundColor: Theme.of(context).disabledColor,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
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
    required index,
    VoidCallback? onTap,
  }) {
    final defaultColor = Theme.of(context).disabledColor;
    return InkWell(
      onTap: () {
        Get.find<BottomNavController>().jumpToPage(index);
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: defaultColor,
        ),
        title: Text(
          title,
          style: TextStyle(color: defaultColor),
        ),
      ),
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(ImagePaths.facebookDrawerIcon),
        SvgPicture.asset(ImagePaths.instagramDrawerIcon),
        SvgPicture.asset(ImagePaths.twitterDrawerIcon),
      ],
    );
  }
}

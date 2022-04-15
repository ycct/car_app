import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';
import '../../../controller/bottom_bar_controller.dart';
import 'drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
                name: "Jane".tr,
                location: "UAE, DUBAI",
              ),
              context.sizedBoxHeightSmall,
              const Divider(
                thickness: 1,
              ),
              buildMenuItem(context,
                  icon: Icons.person,
                  title: "profile".tr,
                  index: 3,
                  ),
              buildMenuItem(
                context,
                icon: Icons.home,
                title: "home".tr,
                index: 0,
              ),
              buildMenuItem(
                context,
                icon: Icons.local_offer,
                title: "offers".tr,
                index: 2,
              ),
              buildMenuItem(
                context,
                icon: Icons.shopping_basket_rounded,
                title: "myProducts".tr,
                index: 1,
              ),
              buildMenuItem(
                context,
                icon: Icons.shopping_basket_rounded,
                title: "settings".tr,
                index: 4,
              ),
              context.sizedBoxHeightDefault,
              context.sizedBoxHeightSmall,
              buildRow()
            ],
          ),
        ),
      );
    });
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
}

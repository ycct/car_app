import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../../constants/app_constants.dart';
import '../../constants/images_paths.dart';
import '../../widgets/elevated_button.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: context.dynamicHeight(1),
            width: context.dynamicHeight(1),
            child:
                SvgPicture.asset(ImagePaths.backgroundImage, fit: BoxFit.cover),
          ),
          Positioned(
            top: context.paddingLargeHeight * 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSvgPicture(context),
                context.sizedBoxHeightSmall,
                buildText(context),
                context.sizedBoxHeightExtraSmall,
              ],
            ),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.16),
            child: CustomElevatedButton(
              onTap: () {
                Get.toNamed("/home");
              },
              title: AppConstants.next,
              width: context.dynamicWidth(0.72),
              height: context.dynamicWidth(0.12),
            ),
          ),
        ],
      ),
    );
  }
  SizedBox buildSvgPicture(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      width: context.dynamicWidth(1),
      child: SvgPicture.asset(
        ImagePaths.verified,
      ),
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      AppConstants.codeVerifiedSuccessfully,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

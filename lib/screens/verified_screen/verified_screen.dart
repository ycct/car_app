import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../../constants/images_paths.dart';
import '../../widgets/elevated_button.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            bottom: -context.dynamicHeight(0.12),
            child: SvgPicture.asset(
              ImagePaths.backgroundImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.55),
            child: buildSvgPicture(context),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.3),
            child: buildText(context),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.10),
            child: CustomElevatedButton(
              onTap: () {
                Get.offAllNamed("/signup");
              },
              title: "next".tr,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSvgPicture(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      width: context.dynamicWidth(1),
      child: SvgPicture.asset(
        ImagePaths.verified,
      ),
    );
  }

  Text buildText(BuildContext context) {
    return Text("verifyMessage".tr, style: context.headline4);
  }
}

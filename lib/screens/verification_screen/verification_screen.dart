import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/controller/login_controller.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/widgets/elevated_button.dart';
import '../../constants/images_paths.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (LoginController loginController) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              bottom: -context.dynamicHeight(0.12),
              child: SvgPicture.asset(ImagePaths.backgroundImage,
                  fit: BoxFit.fitWidth),
            ),
            Positioned(
              bottom: context.dynamicHeight(0.55),
              child: buildSvgPicture(context),
            ),
            Positioned(
              bottom: context.dynamicHeight(0.26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.sizedBoxHeightSmall,
                  buildText(
                    context,
                    "verifyCode".tr,
                  ),
                  context.sizedBoxHeightExtraSmall,
                  context.sizedBoxHeightUltraSmall,
                  Text(
                    "pleaseEnter".tr,
                    style: context.bodyText1,
                  ),
                  context.sizedBoxHeightUltraSmall,
                ],
              ),
            ),
            Positioned(
              bottom: context.dynamicHeight(0.1),
              child: buildCustomElevatedButton(context, loginController),
            ),
          ],
        ),
      );
    });
  }

  CustomElevatedButton buildCustomElevatedButton(
      BuildContext context, LoginController loginController) {
    return CustomElevatedButton(
      onTap: () async {
        buildShowDialog(context);
        // loginController.verificationCodeInputGetter();
        // await loginController.verifyUser();
        // await Future.delayed(const Duration(seconds: 1));
        // Navigator.pop(context);
        // loginController.userVerificationChecker();
      },
      title: "verify".tr,
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        });
  }

  SizedBox buildSvgPicture(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      width: context.dynamicHeight(1),
      child: SvgPicture.asset(
        ImagePaths.verification,
      ),
    );
  }

  Text buildText(BuildContext context, String title) {
    return Text(title, style: context.headline4);
  }

  Padding buildTextField(
      BuildContext context, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingExtraSmallWidth),
      child: CircleAvatar(
        backgroundColor: context.primaryColor.withOpacity(0.1),
        radius: context.dynamicWidth(0.09),
        child: TextFormField(
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: AppConstants.defaultFont),
          cursorHeight: AppConstants.defaultFont,
          onChanged: (value) {
            value.isNotEmpty ? FocusScope.of(context).nextFocus() : null;
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

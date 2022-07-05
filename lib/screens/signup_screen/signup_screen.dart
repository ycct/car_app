import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/extensions.dart';
import '../../constants/app_constants.dart';
import '../../constants/images_paths.dart';
import '../../widgets/elevated_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildBackgroundImage(context),
          Positioned(
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            bottom: context.dynamicHeight(0.75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(context, 32, "signUp".tr),
                context.sizedBoxHeightUltraSmall,
                buildText(context, 16, "registerAnAcc".tr),
              ],
            ),
          ),
          Positioned(
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            bottom: context.dynamicHeight(0.4),
            child: buildTextFieldColumn(context),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.17),
            child: Column(
              children: [
                buildCustomElevatedButton(context),
                context.sizedBoxHeightExtraSmall,
                buildText(context, 16, "orConnect".tr),
                context.sizedBoxHeightExtraSmall,
                buildAuthButtonsRow(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text buildText(BuildContext context, double fontSize, String title) {
    return Text(
      title,
      style: context.headline4?.copyWith(fontSize: fontSize),
    );
  }

  SizedBox buildAuthButtonsRow(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: buildAuthButtons(const Color(0xFF3479EA), "facebook".tr,
                ImagePaths.facebookLogo, Colors.white),
          ),
          context.sizedBoxWidthExtraSmall,
          Expanded(
            child: buildAuthButtons(
                Colors.white, "google".tr, ImagePaths.googleLogo, Colors.grey),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildAuthButtons(
      Color color, String title, String path, Color textColor) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(path),
      label: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          ),
        ),
      ),
    );
  }

  CustomElevatedButton buildCustomElevatedButton(BuildContext context) {
    return CustomElevatedButton(
      title: "done".tr,
      onTap: () async {
        FocusScope.of(context).unfocus();
        buildShowDialog(context);
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
        Get.offAllNamed("/home");
      },
    );
  }

  Column buildTextFieldColumn(BuildContext context) {
    return Column(
      children: [
        buildRoundedForm(context, true, "Name", true, false),
        buildRoundedForm(context, false, "Email", false, false),
        buildRoundedForm(context, false, "Password", false, true),
        buildRoundedForm(context, false, "Address", false, false),
        buildRoundedForm(
            context, true, "Date of Birth(optional)", false, false),
      ],
    );
  }

  TextFormField buildRoundedForm(BuildContext context, bool isRounded,
      String title, bool isTop, bool isPassword) {
    return TextFormField(
      autocorrect: false,
      obscureText: isPassword ? true : false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: context.primaryColor.withOpacity(0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.primaryColor),
          borderRadius: isRounded
              ? isTop
                  ? const BorderRadius.only(
                      topRight: Radius.circular(AppConstants.defaultRadius),
                      topLeft: Radius.circular(AppConstants.defaultRadius),
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(AppConstants.defaultRadius),
                      bottomRight: Radius.circular(AppConstants.defaultRadius),
                    )
              : const BorderRadius.only(),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: isRounded
              ? isTop
                  ? const BorderRadius.only(
                      topRight: Radius.circular(AppConstants.defaultRadius),
                      topLeft: Radius.circular(AppConstants.defaultRadius),
                    )
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(AppConstants.defaultRadius),
                      bottomLeft: Radius.circular(AppConstants.defaultRadius),
                    )
              : const BorderRadius.only(),
          borderSide: BorderSide(
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }

  Positioned buildBackgroundImage(BuildContext context) {
    return Positioned.fill(
      bottom: -context.dynamicHeight(0.12),
      child: SvgPicture.asset(
        ImagePaths.backgroundImage,
        fit: BoxFit.fitWidth,
      ),
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
}

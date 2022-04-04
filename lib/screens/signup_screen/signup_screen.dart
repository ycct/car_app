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
                buildText(context, 32, AppConstants.signUp),
                context.sizedBoxHeightUltraSmall,
                buildText(context, 16, AppConstants.registerAnAccount),
              ],
            ),
          ),
          Positioned(
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            bottom: context.dynamicHeight(0.4),
            child: buildColumn(context),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.17),
            child: Column(
              children: [
                CustomElevatedButton(
                  title: AppConstants.done,
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    buildShowDialog(context);
                    await Future.delayed(const Duration(seconds: 1));
                    Navigator.pop(context);
                    Get.offAllNamed("/home");
                  },
                ),
                context.sizedBoxHeightExtraSmall,
                buildText(context, 16, AppConstants.orConnectThrough),
                context.sizedBoxHeightExtraSmall,
                SizedBox(
                  width: context.dynamicWidth(0.8),
                  height: context.dynamicHeight(0.06),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: buildAuthButtons(
                            const Color(0xFF3479EA),
                            AppConstants.facebook,
                            ImagePaths.facebook,
                            Colors.white),
                      ),
                      context.sizedBoxWidthExtraSmall,
                      Expanded(
                        child: buildAuthButtons(
                            Colors.white,
                            AppConstants.google,
                            ImagePaths.google,
                            Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
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

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        buildRoundedTextFormField(context, true, "Name", true, false),
        buildRoundedTextFormField(context, false, "Email", false, false),
        buildRoundedTextFormField(context, false, "Password", false, true),
        buildRoundedTextFormField(context, false, "Address", false, false),
        buildRoundedTextFormField(
            context, true, "Date of Birth (optional) ", false, false),
      ],
    );
  }

  TextFormField buildRoundedTextFormField(BuildContext context, bool isRounded,
      String title, bool isTop, bool isPassword) {
    return TextFormField(
      autocorrect: false,
      obscureText: isPassword ? true : false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor.withOpacity(0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Text buildText(BuildContext context, double fontSize, String title) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.headline4?.copyWith(fontSize: fontSize),
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

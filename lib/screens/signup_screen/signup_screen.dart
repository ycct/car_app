import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: Stack(alignment: Alignment.center, children: [
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
          child: Column(
            children: [
              buildRoundedTextFormField(context, true, "Name", true),
              buildRoundedTextFormField(context, false, "Email", false),
              buildRoundedTextFormField(context, false, "Password", false),
              buildRoundedTextFormField(context, false, "Address", false),
              buildRoundedTextFormField(context, true, "Date of Birth ", false),
            ],
          ),
        ),
        Positioned(
          bottom: context.dynamicHeight(0.1),
          child: CustomElevatedButton(
            title: AppConstants.verify,
            onTap: () async {},
          ),
        )
      ]),
    );
  }

  Text buildText(BuildContext context, double fontSize, String title) {
    return Text(
      title,
      style: context.theme.textTheme.headline4?.copyWith(fontSize: fontSize),
    );
  }

  TextFormField buildRoundedTextFormField(
      BuildContext context, bool isRounded, String title, bool isTop) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      autofocus: true,
      decoration: InputDecoration(
        hintText: title,
        hintStyle:
            TextStyle(color: context.theme.primaryColor.withOpacity(0.4)),
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

  Positioned buildBackgroundImage(BuildContext context) {
    return Positioned.fill(
      bottom: -context.dynamicHeight(0.12),
      child: SvgPicture.asset(
        ImagePaths.backgroundImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

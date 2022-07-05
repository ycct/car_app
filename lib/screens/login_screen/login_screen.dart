import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/controller/login_controller.dart';
import 'package:yallawashtest/extensions.dart';
import '../../widgets/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LoginController loginController) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              alignment: Alignment.center,
              children: [
                buildBackgroundImage(context),
                Positioned(
                  bottom: context.dynamicHeight(0.3),
                  child: buildTextColumn(context),
                ),
                Positioned(
                  bottom: context.dynamicHeight(0.1),
                  child: buildFieldButtonColumn(context, loginController),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildTextColumn(BuildContext context) {
    return Column(
      children: [
        buildHeadline(context, "welcome".tr),
        context.sizedBoxHeightUltraSmall,
        buildSubtitle(context, "getOffers".tr),
        context.sizedBoxHeightLarge,
        context.sizedBoxHeightLarge,
        buildHeadline(context, "verifyNumber".tr),
        context.sizedBoxHeightUltraSmall,
        buildSubtitle(context, "enterNumber".tr),
        context.sizedBoxHeightSmall,
        context.sizedBoxHeightExtraSmall,
      ],
    );
  }

  Column buildFieldButtonColumn(
      BuildContext context, LoginController loginController) {
    return Column(
      children: [
        buildTextField(context, loginController),
        context.sizedBoxHeightExtraSmall,
        buildCustomElevatedButton(context, loginController),
      ],
    );
  }

  SizedBox buildTextField(
      BuildContext context, LoginController loginController) {
    return SizedBox(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: buildCountryCode(context, loginController),
          ),
          const Spacer(),
          Expanded(
            flex: 30,
            child: buildTextFormField(
              context,
            ),
          )
        ],
      ),
    );
  }

  CustomElevatedButton buildCustomElevatedButton(
      BuildContext context, LoginController loginController) {
    return CustomElevatedButton(
        title: "verify".tr,
        onTap: () async {
          FocusScope.of(context).unfocus();
          buildShowDialog(context);
          // await loginController.login();
          // await Future.delayed(const Duration(seconds: 1));
          // Navigator.pop(context);
          // loginController.loginRequestChecker();
          // loginController.clearTextFields();
        });
  }

  Text buildHeadline(BuildContext context, String title) {
    return Text(
      title,
      style: context.headline5?.copyWith(fontSize: AppConstants.defaultFont),
    );
  }

  Text buildSubtitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.subtitle1,
      textAlign: TextAlign.center,
    );
  }

  Container buildCountryCode(
      BuildContext context, LoginController loginController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.primaryColor),
        borderRadius: BorderRadius.circular(
          AppConstants.largeRadius,
        ),
      ),
      child: CountryCodePicker(
        onChanged: (value) {
          var valueString = value.toString();
          loginController.countryCodePicker(valueString);
        },
        textStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: context.primaryColor,
        ),
        padding: const EdgeInsets.all(0),
        backgroundColor: context.disabledColor,
        showCountryOnly: false,
        showFlag: false,
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        initialSelection: "SD",
      ),
    );
  }

  Widget buildTextFormField(
    BuildContext context,
  ) {
    return TextFormField(
      // controller: controller,
      expands: true,
      maxLines: null,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
        ),
        labelText: "phoneNumber".tr,
        labelStyle: TextStyle(color: context.primaryColor),
        fillColor: context.disabledColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          borderSide: BorderSide(color: context.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          borderSide: BorderSide(
            color: context.primaryColor,
          ),
        ),
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

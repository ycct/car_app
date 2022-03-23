import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
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
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.dynamicWidth(0.73),
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
                                loginController.numberController,
                              ),
                            )
                          ],
                        ),
                      ),
                      context.sizedBoxHeightExtraSmall,
                      CustomElevatedButton(
                        title: AppConstants.verify,
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          buildShowDialog(context);
                          await loginController.login();
                          await Future.delayed(const Duration(seconds: 1));
                          Navigator.pop(context);
                          loginController.loginRequestChecker();
                          loginController.clearTextFields();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        );
      },
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

  Column buildTextColumn(BuildContext context) {
    return Column(
      children: [
        buildText(
          context,
          AppConstants.welcomeToYallaWash,
          Theme.of(context).textTheme.headline5?.copyWith(
                fontSize: AppConstants.defaultFont,
              ),
        ),
        context.sizedBoxHeightUltraSmall,
        buildText(
          context,
          AppConstants.getTheUltimateOffers,
          Theme.of(context).textTheme.subtitle1,
        ),
        context.sizedBoxHeightLarge,
        context.sizedBoxHeightLarge,
        buildText(
          context,
          AppConstants.verifyYourNumber,
          Theme.of(context).textTheme.headline5,
        ),
        context.sizedBoxHeightUltraSmall,
        buildText(
          context,
          AppConstants.pleaseEnterYourNumber,
          Theme.of(context).textTheme.subtitle1,
        ),
        context.sizedBoxHeightSmall,
        context.sizedBoxHeightExtraSmall,
      ],
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

  Container buildCountryCode(
      BuildContext context, LoginController loginController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
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
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(0),
        backgroundColor: Theme.of(context).disabledColor,
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
      BuildContext context, TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
        labelText: AppConstants.phoneNumber,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        fillColor: Theme.of(context).disabledColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Text buildText(
    BuildContext context,
    String title,
    TextStyle? style,
  ) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}

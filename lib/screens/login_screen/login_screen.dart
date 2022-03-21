import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                Positioned.fill(
                  bottom: -context.dynamicHeight(0.12),
                  child: SvgPicture.asset(
                    ImagePaths.backgroundImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  bottom: context.dynamicHeight(0.3),
                  child: Column(
                    children: [
                      buildText(
                        context,
                        AppConstants.welcomeToYallaWash,
                        Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontSize: AppConstants.defaultFont),
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
                  ),
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
                              child: buildCountryCode(context),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 30,
                              child: buildTextFormField(context),
                            )
                          ],
                        ),
                      ),
                      context.sizedBoxHeightExtraSmall,
                      CustomElevatedButton(
                        title: AppConstants.verify,
                        onTap: () {
                          loginController.login();
                          // Get.toNamed("/verification");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Container buildCountryCode(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(
          AppConstants.largeRadius,
        ),
      ),
      child: CountryCodePicker(
        onChanged: (value) {
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
        initialSelection: "IN",
      ),
    );
  }

  Widget buildTextFormField(BuildContext context) {
    return TextFormField(
      expands: true,
      maxLines: null,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(9),
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

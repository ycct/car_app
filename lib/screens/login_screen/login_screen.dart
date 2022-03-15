import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/constants/images_paths.dart';
import 'package:yallawashtest/extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: context.dynamicHeight(1),
            width: context.dynamicHeight(1),
            child:
                SvgPicture.asset(ImagePaths.backgroundImage, fit: BoxFit.cover),
          ),
          Positioned(
            top: context.dynamicHeight(0.3),
            child: buildText(
                context,
                AppConstants.welcomeToYallaWash,
                Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: AppConstants.defaultFont),
                FontWeight.bold),
          ),
          Positioned(
            top: context.dynamicHeight(0.36),
            child: buildText(context, AppConstants.getTheUltimateOffers,
                Theme.of(context).textTheme.subtitle1, FontWeight.normal),
          ),
          Positioned(
            top: context.dynamicHeight(0.5),
            child: buildText(context, AppConstants.verifyYourNumber,
                Theme.of(context).textTheme.headline5, FontWeight.bold),
          ),
          Positioned(
            top: context.dynamicHeight(0.55),
            child: buildText(context, AppConstants.pleaseEnterYourNumber,
                Theme.of(context).textTheme.subtitle1, FontWeight.normal),
          ),
          Positioned(
            top: context.dynamicHeight(0.65),
            //
            child: SizedBox(
              width: context.dynamicWidth(0.73),
              child: Row(
                children: [
                  Container(
                    width: context.dynamicWidth(0.18),
                    height: context.dynamicWidth(0.12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(
                        35,
                      ),
                    ),
                    child: CountryCodePicker(

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
                  ),
                  context.sizedBoxWidthExtraSmall,
                  SizedBox(
                    width: context.dynamicWidth(0.52),
                    height: context.dynamicWidth(0.12),
                    child: TextFormField(
                        decoration: InputDecoration(
                      labelText: AppConstants.phoneNumber,
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      fillColor: Theme.of(context).disabledColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.largeRadius),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.largeRadius),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: context.dynamicHeight(0.73),
              child: buildElevatedButton(context))
        ],
      ),
    ));
  }

  Stack buildElevatedButton(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: context.dynamicWidth(0.72),
          height: context.dynamicWidth(0.12),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.largeRadius),
            ))),
            onPressed: () {
              Get.toNamed("/home");
            },
            child: const Text(
              AppConstants.verify,
              style: TextStyle(fontSize: AppConstants.smallFont),
            ),
          ),
        ),
        SvgPicture.asset(
          ImagePaths.buttonShadow,
        ),
      ],
    );
  }

  SizedBox buildTextField(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.72),
      height: context.dynamicWidth(0.12),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: AppConstants.largePadding),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.largePadding)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              AppConstants.largeRadius,
            ),
          ),
          // labelText: "+ 971 | Phone Number",
          hintText: "+ 971 | Phone Number",
        ),
      ),
    );
  }

  Text buildText(BuildContext context, String title, TextStyle? style,
      FontWeight fontWeight) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: style?.copyWith(fontWeight: fontWeight),
    );
  }
}

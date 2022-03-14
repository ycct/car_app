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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildText(context, AppConstants.welcomeToYallaWash,
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: AppConstants.defaultFont), FontWeight.bold),
            ),
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
            child: SizedBox(
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
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(
                          AppConstants.largeRadius,
                        )),
                    labelText: "+ 971 | Phone Number",
                    labelStyle: const TextStyle(color: Colors.blue)),
              ),
            ),
          ),
          Positioned(
              top: context.dynamicHeight(0.73),
              child: Stack(
                children: [
                  SizedBox(
                    width: context.dynamicWidth(0.72),
                    height: context.dynamicWidth(0.12),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ))),
                      onPressed: () {
                        Get.offAllNamed("/home");
                      },
                      child: const Text(
                        AppConstants.verify,
                        style: TextStyle(fontSize: AppConstants.smallFont),
                      ),
                    ),
                  ),
                  Positioned(child: SvgPicture.asset(ImagePaths.buttonShadow)),
                ],
              ))
        ],
      ),
    ));
  }

  Text buildText(BuildContext context, String title, TextStyle? style,
      FontWeight fontWeight) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: style?.copyWith(color: Colors.blue, fontWeight: fontWeight),
    );
  }
}

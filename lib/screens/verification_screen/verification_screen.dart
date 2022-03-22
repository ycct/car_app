import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/widgets/elevated_button.dart';
import '../../constants/images_paths.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            bottom: context.dynamicHeight(0.28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                context.sizedBoxHeightSmall,
                buildText(context),
                context.sizedBoxHeightExtraSmall,
                Row(
                  children: [
                    buildTextField(context),
                    buildTextField(context),
                    buildTextField(context),
                    buildTextField(context),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.1),
            child: CustomElevatedButton(
              onTap: () {
                Get.offAllNamed("/verified");
              },
              title: AppConstants.verify,
            ),
          ),
        ],
      ),
    );
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

  Text buildText(BuildContext context) {
    return Text(
      AppConstants.verificationCode,
      style: Theme.of(context)
          .textTheme
          .headline4
    );
  }

  Padding buildTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingExtraSmallWidth),
      child: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        radius: context.dynamicWidth(0.09),
        child: TextFormField(
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

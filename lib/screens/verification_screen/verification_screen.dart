import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: context.dynamicHeight(1),
              width: context.dynamicHeight(1),
              child: SvgPicture.asset(ImagePaths.backgroundImage,
                  fit: BoxFit.cover),
            ),
            Positioned(
              top: context.paddingLargeHeight * 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.25),
                    width: context.dynamicWidth(1),
                    child: SvgPicture.asset(
                      ImagePaths.verification,
                    ),
                  ),
                  context.sizedBoxHeightSmall,
                  Text(
                    AppConstants.verificationCode,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  context.sizedBoxHeightUltraSmall,
                  SizedBox(
                    height: context.dynamicHeight(0.13),
                    width: context.dynamicWidth(1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.06)),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.paddingExtraSmallWidth),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              radius: context.dynamicWidth(0.09),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 25),
                                cursorHeight: 30,
                                onChanged: (value) {
                                  value.isNotEmpty
                                      ? FocusScope.of(context).nextFocus()
                                      : null;
                                },
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  context.sizedBoxHeightSmall,
                  Text(
                    "Re-send (30s)",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  context.sizedBoxHeightUltraSmall,
                  CustomElevatedButton(
                    onTap: () {
                      Get.toNamed("/home");
                    },
                    title: AppConstants.verify,
                    width: context.dynamicWidth(0.72),
                    height: context.dynamicWidth(0.12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

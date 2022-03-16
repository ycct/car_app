import 'package:flutter/material.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';

class RemainingCard extends StatelessWidget {
  final String detail;
  final String photoUrl;

  const RemainingCard({
    Key? key,
    required this.myHeight,
    required this.myWidth,
    required this.title,
    required this.detail,
    required this.photoUrl,
  }) : super(key: key);

  final double myHeight;
  final double myWidth;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingExtraSmallWidth),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.extraSmallRadius),
        ),
        elevation: 5,
        child: Stack(
          children: [
            SizedBox(
              height: myHeight,
              width: myWidth,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(photoUrl),
              ),
            ),
            Positioned(
              left: -70,
              top: -12,
              child: CircleAvatar(
                backgroundColor: context.theme.primaryColor,
                radius: 95,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppConstants.extraLargePadding * 1.5,
                      top: AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: context.theme.textTheme.subtitle1!.copyWith(
                            color: context.theme.disabledColor,
                            fontSize: AppConstants.smallFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        detail,
                        style: context.theme.textTheme.subtitle1!.copyWith(
                          color: context.theme.disabledColor,
                          fontSize: AppConstants.ultraSmallFont,
                        ),
                      ),
                      context.sizedBoxHeightExtraSmall,
                      SizedBox(
                        width: context.dynamicWidth(0.22),
                        height: context.dynamicHeight(0.025),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).disabledColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            AppConstants.continueHere,
                            style: context.theme.textTheme.subtitle1!.copyWith(
                                fontSize: AppConstants.ultraSmallFont),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

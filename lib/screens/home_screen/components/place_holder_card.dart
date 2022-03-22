import 'package:flutter/material.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';

class DetailedCard extends StatelessWidget {
  const DetailedCard({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingExtraSmallWidth),
      child: Stack(
        children: [
          Card(
            color: Theme.of(context).disabledColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppConstants.extraSmallRadius),
            ),
            elevation: 5,
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Positioned(
                    left: context.dynamicWidth(0.02),
                    top: context.dynamicHeight(0.01),


                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildImage(context),
                        context.sizedBoxWidthExtraSmall,
                        buildTextColumn(context)
                      ],
                    ),
                  ),
                  Positioned(
                    left: context.dynamicWidth(0.02),
                    top: context.dynamicHeight(0.11),
                    child: buildTextIconRow(
                      context,
                      AppConstants.likesCount,
                      Icons.favorite,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 40,
                    child: buildTextIconRow(
                      context,
                      AppConstants.daysLeft,
                      Icons.update,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: buildElevatedButton(context),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: buildUnderline(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
      height: context.dynamicWidth(0.18),
      width: context.dynamicWidth(0.18),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
          ),
        ),
        borderRadius: BorderRadius.circular(AppConstants.extraSmallRadius),
      ),
    );
  }

  Column buildTextColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCardsText(context, AppConstants.theOfferName,
            AppConstants.extraSmallFont, FontWeight.bold),
        context.sizedBoxHeightUltraSmall,
        buildCardsText(context, AppConstants.theOffersDetails,
            AppConstants.extraSmallFont - 2),
        context.sizedBoxHeightUltraSmall,
        buildCardsText(
            context, AppConstants.viewMore, AppConstants.extraSmallFont - 4)
      ],
    );
  }

  Text buildCardsText(BuildContext context, String title, double fontSize,
      [FontWeight? fontWeight]) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.subtitle1!
          .copyWith(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }


  SizedBox buildElevatedButton(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.03),
      width: context.dynamicWidth(0.4),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.smallRadius),
            ),
          ),
        ),
        child: Text(
          AppConstants.shopNow,
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
        onPressed: () {},
      ),
    );
  }

  Container buildUnderline(BuildContext context) {
    return Container(
      height: 3,
      width: context.dynamicWidth(0.5),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(
          AppConstants.extraSmallRadius,
        ),
      ),
    );
  }

  Row buildTextIconRow(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppConstants.extraSmallFont,
        ),
        Text(title, style: context.theme.textTheme.subtitle2),
      ],
    );
  }

}

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
    final double imageWidthHeight = context.dynamicWidth(0.18);
    final double buttonHeight = context.dynamicHeight(0.03);
    final double buttonWidth = context.dynamicWidth(0.4);
    final double cardDefaultPaddingWidth = context.paddingExtraSmallWidth;
    final double cardDefaultPaddingHeight = context.paddingExtraSmallHeight;
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
                    left: cardDefaultPaddingWidth,
                    top: cardDefaultPaddingHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildImage(context, imageWidthHeight, imageWidthHeight),
                        context.sizedBoxWidthExtraSmall,
                        buildTextColumn(context)
                      ],
                    ),
                  ),
                  Positioned(
                    left: cardDefaultPaddingWidth,
                    top: cardDefaultPaddingHeight +
                        imageWidthHeight +
                        context.paddingUltraSmallWidth,
                    child: buildTextIconRow(
                      context,
                      AppConstants.likesCount,
                      Icons.favorite,
                    ),
                  ),
                  Positioned(
                    right: cardDefaultPaddingWidth,
                    bottom: cardDefaultPaddingHeight +
                        buttonHeight +
                        context.paddingUltraSmallHeight,
                    child: buildTextIconRow(
                      context,
                      AppConstants.daysLeft,
                      Icons.update,
                    ),
                  ),
                  Positioned(
                    right: cardDefaultPaddingWidth,
                    bottom: cardDefaultPaddingHeight,
                    child:
                        buildElevatedButton(context, buttonWidth, buttonHeight),
                  ),
                  Positioned(
                    bottom: 0,
                    right: cardDefaultPaddingWidth,
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

  Container buildImage(BuildContext context, double width, double height) {
    return Container(
      height: height,
      width: width,
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
        buildCardsText(
            context,
            AppConstants.theOfferName,
            Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),),
        context.sizedBoxHeightUltraSmall,
        buildCardsText(context, AppConstants.theOffersDetails,
            Theme.of(context).textTheme.subtitle2),
        context.sizedBoxHeightUltraSmall,
        buildCardsText(context, AppConstants.viewMore,
            Theme.of(context).textTheme.caption)
      ],
    );
  }

  Text buildCardsText(
    BuildContext context,
    String title,
    TextStyle? style,
  ) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }

  SizedBox buildElevatedButton(
      BuildContext context, double width, double height) {
    return SizedBox(
      height: height,
      width: width,
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

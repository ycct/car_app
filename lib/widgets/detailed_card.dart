import 'package:flutter/material.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';

class MyCardDetailed extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final String offerName;
  final String offerDetail;
  final String? dayLeft;

  const MyCardDetailed({
    Key? key,
    this.dayLeft,
    required this.height,
    required this.width,
    required this.imageUrl,
    required this.offerName,
    required this.offerDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingSmallWidth),
      child: SizedBox(
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.paddingExtraSmallWidth),
              child: Card(
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
                      Padding(
                        padding: EdgeInsets.all(context.paddingSmallWidth),
                        child: buildImageAndText(context),
                      ),
                      Positioned(
                        left: 15,
                        top: 90,
                        child: buildIconAndText(
                            context, AppConstants.likesCount, Icons.favorite),
                      ),
                      Positioned(
                        right: 15,
                        bottom: 40,
                        child: buildIconAndText(
                            context, AppConstants.daysLeft, Icons.update),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: buildCardsButton(context,AppConstants.shopNow),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 5,
                          width: context.dynamicWidth(0.5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                              AppConstants.extraSmallRadius,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox buildCardsButton(BuildContext context,String title) {
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
        child:  Text(title),
        onPressed: () {},
      ),
    );
  }

  Row buildImageAndText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
            borderRadius: BorderRadius.circular(AppConstants.extraSmallRadius),
          ),
        ),
        context.sizedBoxWidthExtraSmall,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCardsText(context, offerName, 15, FontWeight.bold),
              context.sizedBoxHeightUltraSmall,
              buildCardsText(context, offerDetail, 13.0),
              context.sizedBoxHeightUltraSmall,
              buildCardsText(context, AppConstants.viewMore, 11)
            ],
          ),
        )
      ],
    );
  }

  Row buildIconAndText(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 17,
        ),
        Text(
          title,
          style: context.theme.textTheme.subtitle1!.copyWith(
              color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Text buildCardsText(BuildContext context, String title, double fontSize,
      [FontWeight? fontWeight]) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.subtitle1!.copyWith(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}

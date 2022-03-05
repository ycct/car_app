import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';

class MyCardDetailed extends StatelessWidget {
  final double myHeight;
  final double myWidth;

  const MyCardDetailed({
    Key? key,
    required this.myHeight,
    required this.myWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingSmallWidth),
      child: SizedBox(
        height: context.dynamicHeight(0.3),
        width: context.dynamicWidth(1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.paddingExtraSmallWidth),
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: SizedBox(
                      height: myHeight,
                      width: myWidth,
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.network(
                                    AppConstants.photoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildCardsText(
                                          context,
                                          "The Offer Name Here",16,FontWeight.bold
                                          ),
                                      context.mySizedBoxHeightUltraSmall,
                                      buildCardsText(
                                          context, "The Offer's Details",14.0),
                                      context.mySizedBoxHeightUltraSmall,
                                      buildCardsText(context, "View More",12)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Text buildCardsText(BuildContext context, String title,double fontSize,
      [FontWeight? fontWeight]) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.subtitle1!.copyWith(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: fontSize
      ),
    );
  }
}

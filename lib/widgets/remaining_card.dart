import 'package:flutter/material.dart';
import 'package:yallawashtest/constants/app_constants.dart';
import 'package:yallawashtest/extensions.dart';

class RemainingCardsListView extends StatelessWidget {
  final double myHeight;
  final double myWidth;
  final String? title;
  final String? details;

  const RemainingCardsListView({
    Key? key,
    required this.myHeight,
    required this.myWidth,
    this.title,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingSmallWidth),
      child: SizedBox(
        height: context.dynamicHeight(0.15),
        width: context.dynamicWidth(1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.paddingExtraSmallWidth),
              child: RemainingCard(
                photoUrl: AppConstants.photoUrl,
                myHeight: myHeight,
                myWidth: myWidth,
                title: title,
                detail: 'Details Here',
              ),
            );
          },
        ),
      ),
    );
  }
}

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
    return Card(
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
              backgroundColor: Colors.blue,
              radius: 95,
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: context.theme.textTheme.subtitle1!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      detail,
                      style: context.theme.textTheme.subtitle1!.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    context.sizedBoxHeightExtraSmall,
                    SizedBox(
                      width: context.dynamicWidth(0.22),
                      height: context.dynamicHeight(0.025),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {},
                          child: Text(
                            AppConstants.continueHere,
                            style: context.theme.textTheme.subtitle1!
                                .copyWith(color: Colors.blue, fontSize: 11),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

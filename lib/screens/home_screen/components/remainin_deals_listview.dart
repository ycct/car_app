import 'package:flutter/cupertino.dart';
import 'package:yallawashtest/extensions.dart';
import '../../../constants/app_constants.dart';
import 'remaining_card.dart';

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
            return RemainingCard(
              photoUrl: AppConstants.photoUrl,
              myHeight: myHeight,
              myWidth: myWidth,
              title: title,
              detail: AppConstants.detailsHere,
            );
          },
        ),
      ),
    );
  }
}

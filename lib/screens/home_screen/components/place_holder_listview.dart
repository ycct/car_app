import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';
import 'place_holder_card.dart';

class PlaceHolderCardsListView extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final String offerName;
  final String offerDetail;
  final String? dayLeft;

  const PlaceHolderCardsListView({
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
            return DetailedCard(
                height: height, width: width, imageUrl: imageUrl);
          },
        ),
      ),
    );
  }
}

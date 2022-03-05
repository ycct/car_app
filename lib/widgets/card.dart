import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';

class MyCard extends StatelessWidget {
  final double myHeight;
  final double myWidth;

  const MyCard({
    Key? key,
    required this.myHeight,
    required this.myWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.paddingSmallWidth),
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';
import 'package:yallawashtest/widgets/discount_card.dart';

class BookedTab extends StatelessWidget {
  const BookedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.paddingExtraSmallWidth),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const DiscountCard();
          },
        ),
      ),
    );
  }
}

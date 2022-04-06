import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';

Widget buildHeader(
    BuildContext context, {
      required String urlImage,
      required String name,
      required String location,
    }) {
  return SizedBox(
    child: Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Theme.of(context).disabledColor,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
        context.sizedBoxWidthSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Theme.of(context).disabledColor),
            ),
            Text(
              location,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Theme.of(context).disabledColor),
            )
          ],
        )
      ],
    ),
  );
}

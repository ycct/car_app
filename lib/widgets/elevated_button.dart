import 'package:flutter/material.dart';
import 'package:yallawashtest/extensions.dart';
import '../constants/app_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final VoidCallback onTap;

  const CustomElevatedButton({
    Key? key,
    this.width,
    this.height,
    this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.dynamicWidth(0.72),
      height: height??context.dynamicHeight(0.06),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.largeRadius),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title ?? "",
          style: const TextStyle(fontSize: AppConstants.smallFont),
        ),
      ),
    );
  }
}

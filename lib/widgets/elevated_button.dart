import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_constants.dart';
import '../constants/images_paths.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final VoidCallback onTap;

  const CustomElevatedButton({
    Key? key,
    this.width,
    this.height,
    this.title, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.largeRadius),
                ),
              ),
            ),
            onPressed: onTap,
            child: Text(
              title ?? "",
              style: const TextStyle(fontSize: AppConstants.smallFont),
            ),
          ),
        ),
        SvgPicture.asset(
          ImagePaths.buttonShadow,
        ),
      ],
    );
  }
}

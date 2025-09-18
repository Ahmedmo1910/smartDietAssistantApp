import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';

class SocialItemWidget extends StatelessWidget {
  final String imgPath;
  const SocialItemWidget({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: const Color.fromARGB(255, 128, 128, 128),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.whiteColor,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.whiteColor,
          backgroundImage: AssetImage(imgPath),
        ),
      ),
    );
  }
}

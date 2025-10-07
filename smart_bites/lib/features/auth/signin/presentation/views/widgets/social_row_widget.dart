import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/social_item_widget.dart';

class SocialRowWidget extends StatelessWidget {
  final void Function()? googleSign;
  final void Function()? facebookSign;
  const SocialRowWidget({super.key, this.googleSign, this.facebookSign});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: googleSign,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SocialItemWidget(imgPath: 'assets/images/google.png'),
          ),
        ),
        GestureDetector(
          onTap: facebookSign,
          child: SocialItemWidget(imgPath: 'assets/images/facebook.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SocialItemWidget(imgPath: 'assets/images/mac.jpg'),
        ),
      ],
    );
  }
}

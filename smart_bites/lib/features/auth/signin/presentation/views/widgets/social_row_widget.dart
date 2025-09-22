import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/social_item_widget.dart';

class SocialRowWidget extends StatelessWidget {
  const SocialRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SocialItemWidget(imgPath: 'assets/images/google.png'),
        ),
        SocialItemWidget(imgPath: 'assets/images/facebook.png'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SocialItemWidget(imgPath: 'assets/images/mac.jpg'),
        ),

      ],
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleAvatarPositioned extends StatelessWidget {
  CircleAvatarPositioned({required this.imageDescUrl, super.key});

  String imageDescUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 390,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage(imageDescUrl),
        ),
      ),
    );
  }
}

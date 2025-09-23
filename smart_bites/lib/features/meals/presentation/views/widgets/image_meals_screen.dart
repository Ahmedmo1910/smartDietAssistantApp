import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageMealScreen extends StatelessWidget {
  ImageMealScreen({required this.imageUrl, super.key});

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      child: Image.asset(imageUrl, width: 150, height: 150, fit: BoxFit.cover),
    );
  }
}

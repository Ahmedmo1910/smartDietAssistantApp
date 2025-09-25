import 'package:flutter/material.dart';

class ImageMealScreen extends StatelessWidget {
  final String imageUrl;
  const ImageMealScreen({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        width: 150,
        height: 150,
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IconInTopLeft extends StatelessWidget {
  const IconInTopLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios, size:20),
      ),
    );
  }
}

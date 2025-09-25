import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextAboveThePage extends StatelessWidget {
  String pageName;
  TextAboveThePage({required this.pageName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Explore Our',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: 'IrishGrover',
          ),
        ),

        Text(
          pageName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: 'IrishGrover',
          ),
        ),
      ],
    );
  }
}

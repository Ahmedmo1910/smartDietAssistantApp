import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });
  final String headerTitle;
  final String headerSubTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Text(
          headerTitle,
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1.6,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          headerSubTitle,
          style: TextStyle(fontSize: 18, letterSpacing: 1.6),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

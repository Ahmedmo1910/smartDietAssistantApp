import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerificationAnimation extends StatelessWidget {
  const VerificationAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animation/verification.json',
      height: 220,
      width: 220,
      repeat: true,
    );
  }
}

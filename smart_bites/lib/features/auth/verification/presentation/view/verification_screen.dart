import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/widgets/verification_screen_body.dart';

class VerificationScreen extends StatelessWidget {
  static const String routeName = 'VerificationScreen';
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(body: SafeArea(child: VerificationScreenBody())),
    );
  }
}

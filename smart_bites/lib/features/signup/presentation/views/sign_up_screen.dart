import 'package:flutter/material.dart';
import 'widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signUpScreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignUpScreenBody()));
  }
}

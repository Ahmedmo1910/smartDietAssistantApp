import 'package:flutter/material.dart';
import 'widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignInScreenBody()));
  }
}

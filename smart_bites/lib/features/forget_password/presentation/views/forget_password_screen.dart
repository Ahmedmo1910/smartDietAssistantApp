import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/features/forget_password/presentation/views/widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ForgetPasswordScreenBody(),
    );
  }
}

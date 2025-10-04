import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/show_custom_dialog.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/widgets/resend_button.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/widgets/verify_button.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/widgets/verification_animation.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/widgets/verification_message.dart';
import 'package:smart_bites/main_screen.dart';

class VerificationScreenBody extends StatefulWidget {
  const VerificationScreenBody({super.key});

  @override
  State<VerificationScreenBody> createState() => _VerificationScreenBodyState();
}

class _VerificationScreenBodyState extends State<VerificationScreenBody> {
  User? user;
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    checkVerification();
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => checkVerification(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkVerification() async {
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;
    if (!mounted) return;
    setState(() {
      isEmailVerified = user?.emailVerified ?? false;
    });

    if (isEmailVerified) {
      timer?.cancel();
      showCustomDialog(
        context,
        titleText: 'Verification Successful!🎉',
        description:
            'Your email has been verified successfully. Welcome aboard!',
        animationPath: 'assets/animation/animation_success.json',
        routeName: MainScreen.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: AppBar(
            backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 30),

              onPressed: () => Navigator.pop(context),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Text('Verification', style: AppTextStyles.semiBold20),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const VerificationAnimation(),
              const SizedBox(height: 50),
              const VerificationMessage(),
              const SizedBox(height: 40),
              ResendButton(user: user),
              const SizedBox(height: 25),
              VerifyButton(
                isEmailVerified: isEmailVerified,
                onPressed: checkVerification,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

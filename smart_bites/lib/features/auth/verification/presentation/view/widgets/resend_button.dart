import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class ResendButton extends StatelessWidget {
  final User? user;
  const ResendButton({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: const Color.fromARGB(255, 101, 177, 1),
            width: 1.0,
          ),

          overlayColor: AppColors.lightPrimaryColor,
        ),
        onPressed: () async {
          try {
            await user?.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Verification link sent. Check your inbox or spam folder.',
                ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error Sending Email $e')));
          }
        },
        child: Text(
          'Resend verification Email',
          style: AppTextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_bites/core/utils/app_colors.dart';

Future<void> showCustomDialog(
  BuildContext context, {
  required String titleText,
  required String description, 
  required String animationPath,
  String? routeName,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animation........)
            Lottie.asset(animationPath, height: 200, width: 200, repeat: true),

            // Title........)
            Text(
              titleText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // Description........)
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // OK Button........)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (routeName != null) {
                  Navigator.pushReplacementNamed(context, routeName);
                }
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    },
  );
}

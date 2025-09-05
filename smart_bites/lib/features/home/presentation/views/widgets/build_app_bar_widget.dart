import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

AppBar buildAppBarWidget() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Column(
      children: [
        Text('SmartBites', style: AppTextStyles.bold20),
        SizedBox(height: 8),
        Text('Hello , User', style: AppTextStyles.medium18),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/profile_test.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
  );
}

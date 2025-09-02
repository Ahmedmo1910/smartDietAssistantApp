import 'package:flutter/material.dart';

AppBar buildAppBarWidget() {
  return AppBar(
    title: Column(
      children: [Text('SmartBites'), SizedBox(height: 8), Text('Hello , User')],
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

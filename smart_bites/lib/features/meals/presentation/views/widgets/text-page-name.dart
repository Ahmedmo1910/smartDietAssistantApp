import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageName extends StatelessWidget {
  PageName({required this.textNamePage, super.key});
  String textNamePage;

  @override
  Widget build(BuildContext context) {
    return Text(
      textNamePage,
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

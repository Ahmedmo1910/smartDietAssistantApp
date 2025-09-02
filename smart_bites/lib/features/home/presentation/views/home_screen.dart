import 'package:flutter/material.dart';
import 'widgets/build_app_bar_widget.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(),
      body: SafeArea(child: HomeScreenBody()),
    );
  }
}

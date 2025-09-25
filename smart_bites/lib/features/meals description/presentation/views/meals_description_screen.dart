import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/meals_desc_widget.dart';
import 'package:smart_bites/widgets/custom_app_bar.dart';

class MealsDescriptionScreen extends StatelessWidget {
  const MealsDescriptionScreen({super.key});
  static const String routeName = 'mealsDescription';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(children: [MealsDescWidget()]),
      ),
    );
  }
}

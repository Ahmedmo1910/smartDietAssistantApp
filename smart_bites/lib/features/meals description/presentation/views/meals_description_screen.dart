import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/meals_desc_widget.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/icon_in_top_left.dart';

class MealsDescriptionScreen extends StatelessWidget {
  const MealsDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconInTopLeft(),
              MealsDescWidget()]),
        ),
      ),
    );
  }
}

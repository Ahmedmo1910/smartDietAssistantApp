import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/home_widget_grid_view.dart';
import 'water_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WaterWidget(),
          Expanded(child: HomeWidgetGridView()),
        ],
      ),
    );
  }
}

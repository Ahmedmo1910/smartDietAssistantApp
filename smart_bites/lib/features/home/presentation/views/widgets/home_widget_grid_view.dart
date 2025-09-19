import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/data/home_widget_data.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_home_widget.dart';

class HomeWidgetGridView extends StatelessWidget {
  const HomeWidgetGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).width * 0.15,
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: MediaQuery.sizeOf(context).width * 0.09,
        mainAxisSpacing: MediaQuery.sizeOf(context).width * 0.09,
        childAspectRatio: 156 / 188,
      ),
      itemCount: getHomeWidget.length,
      itemBuilder: (context, index) {
        final item = getHomeWidget[index];
        return CustomHomeWidget(
          text: item.text,
          widget: item.widget,
          buttonText: item.buttonText,
          routeName: item.routeName,
        );
      },
    );
  }
}

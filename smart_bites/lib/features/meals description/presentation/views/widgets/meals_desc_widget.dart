import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/circle_avatar_positioned.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/container_positioned.dart';

class MealsDescWidget extends StatelessWidget {
  const MealsDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 700,
      width: double.infinity,

      child: Stack(
        children: [
          ContainerPositioned(
            nameMealsDesc: 'Omelette with Vegetables',
            numKcalDesc: 250,
            mealsDesc:
                'Omelette with vegetables, like other types of omelette. Was originally created by mixing eggs with onions, tomatoes, mushrooms, and peppers, then cooked in a hot pan with butter.',
          ),

          CircleAvatarPositioned(imageDescUrl: 'assets/images/omlett.jpg'),
        ],
      ),
    );
  }
}

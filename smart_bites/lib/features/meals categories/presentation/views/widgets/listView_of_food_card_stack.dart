// ignore: file_names
import 'package:flutter/material.dart';

import 'food_card_stack.dart';

class ListViewOfFoodCardStack extends StatelessWidget {
  const ListViewOfFoodCardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        foodCardStack( imagePath: 'assets/images/tomatoes.png', numOfKcal: 18),

        foodCardStack( imagePath: 'assets/images/onion.png' ,numOfKcal: 40),

        foodCardStack( imagePath: 'assets/images/option.png' ,numOfKcal: 12),

        foodCardStack( imagePath: 'assets/images/tomatoes.png' ,numOfKcal: 12),

        foodCardStack( imagePath: 'assets/images/tomatoes.png', numOfKcal: 18),

        foodCardStack( imagePath: 'assets/images/tomatoes.png', numOfKcal: 18),

      ],
    );
  }
}

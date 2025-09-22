import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodCategorySection extends StatelessWidget {
  FoodCategorySection({
    required this.imageUrl,
    required this.nameOfTheMeals,
    required this.numOfKcal,
    super.key,
  });

  String imageUrl;
  String nameOfTheMeals;
  int numOfKcal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 350,
      width: 242,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              width: 242,
              decoration: BoxDecoration(
                color: const Color(0xFFDAECC5),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        nameOfTheMeals,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'Kcal: $numOfKcal',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(width: 40),

                      GestureDetector(
                        child: Text(
                          'show more..',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}

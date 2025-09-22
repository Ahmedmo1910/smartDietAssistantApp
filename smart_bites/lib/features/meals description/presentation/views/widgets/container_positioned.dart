import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/icon_and_button.dart';

// ignore: must_be_immutable
class ContainerPositioned extends StatelessWidget {
  ContainerPositioned({
    required this.nameMealsDesc,
    required this.numKcalDesc,
    required this.mealsDesc,
    super.key,
  });

  String nameMealsDesc;
  int numKcalDesc;
  String mealsDesc;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      child: Container(
        height: 400,
        width: 242,
        decoration: BoxDecoration(
          color: const Color(0xFFDDEECB),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  nameMealsDesc,
                  style: TextStyle(
                    fontSize: 28.21,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 25),

                Text(
                  'Kcal : $numKcalDesc',
                  style: TextStyle(
                    color: Color(0xff8DC048),
                    fontSize: 22.57,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        mealsDesc,
                        style: TextStyle(
                          fontSize: 15.4,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                IconAndButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

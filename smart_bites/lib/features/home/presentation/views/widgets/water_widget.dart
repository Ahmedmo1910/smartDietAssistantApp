import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/features/home/domain/cup_model.dart';
import 'package:smart_bites/features/home/domain/water_model.dart';
import 'cup_widget.dart';
import 'customize_your_goal.dart';
// put WaterModel + CupModel in this file

class WaterWidget extends StatefulWidget {
  const WaterWidget({super.key});

  @override
  State<WaterWidget> createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  late WaterModel waterModel;

  @override
  void initState() {
    super.initState();
    waterModel = WaterModel(
      goalMl: 2000,
      currentMl: 600,
    ); // Example: already drank 600 ml
  }

  @override
  Widget build(BuildContext context) {
    final cups = generateCups(waterModel.totalCups, waterModel.filledCups);

    return AspectRatio(
      aspectRatio: 355 / 167,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Water',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CustomizeYourGoal(),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cups.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final cup = cups[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // if it's addButton → add water
                        if (cup.addButton) {
                          waterModel.currentMl += waterModel.cupSize;
                          if (waterModel.currentMl > waterModel.goalMl) {
                            waterModel.currentMl = waterModel.goalMl;
                          }
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: CupWidget(
                        filled: cup.filled,
                        addButton: cup.addButton,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: Text(
                "${waterModel.currentMl} / ${waterModel.goalMl} ml",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



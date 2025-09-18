// custom widget ==> slider
import 'package:flutter/material.dart';

class CaloriesSlider extends StatelessWidget {
  final double currentValue;
  final double maxtValue;
  const CaloriesSlider({
    super.key,
    required this.currentValue,
    required this.maxtValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Taken",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Your Calories",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.green,
              overlayColor: Colors.green,
              trackHeight: 10,
            ),
            child: Slider(
              value: currentValue,
              max: maxtValue,
              min: 0,
              onChanged: (value) {},
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${currentValue.toInt()}",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${maxtValue.toInt()}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

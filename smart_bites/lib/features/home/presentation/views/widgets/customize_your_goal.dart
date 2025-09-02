import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';
import 'custom_text_field.dart';

class CustomizeYourGoal extends StatelessWidget {
  const CustomizeYourGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Color(0xFFFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                      child: CustomTextFormField(
                        hintText: 'Your Goal',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Cup Size',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    MainButton(
                      width: 90.32,
                      height: 30.38,
                      text: 'Edit',
                      hasCircularBorder: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: 60,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.more_horiz, size: 23),
      ),
    );
  }
}

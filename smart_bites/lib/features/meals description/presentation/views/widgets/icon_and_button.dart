import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';

class IconAndButton extends StatelessWidget {
  const IconAndButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff8DC048),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),

          child: Center(child: Icon(Icons.favorite, color: Colors.white)),
        ),

        SizedBox(width: 20),

        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),

          child: MainButton(
            text: 'Add To My Goal',
            onTap: () {},
            width: 240,
            height: 50,
            hasCircularBorder: true,
          ),
        ),
      ],
    );
  }
}

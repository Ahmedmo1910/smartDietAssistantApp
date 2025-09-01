import 'package:flutter/material.dart';

class TextBottomWidget extends StatelessWidget {
  final String textStatic;
  final String textBottom;
  final Widget? destination;
  final bool? isPop;
  const TextBottomWidget({
    super.key,
    required this.textStatic,
    required this.textBottom,
    this.destination,
    this.isPop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textStatic),
        TextButton(
          onPressed: () {
            if (isPop!) {
              Navigator.pop(context);
            } else if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (cotext) => destination!),
              );
            }
          },
          child: Text(
            textBottom,
            style: TextStyle(
              color: Color(0xff8DC048),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

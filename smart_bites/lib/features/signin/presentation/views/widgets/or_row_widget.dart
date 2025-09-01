import 'package:flutter/material.dart';

class OrRowWidget extends StatelessWidget {
  final String textOr;
  const OrRowWidget({super.key, required this.textOr});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:  Text('Or $textOr with', style: TextStyle(fontSize: 20)),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

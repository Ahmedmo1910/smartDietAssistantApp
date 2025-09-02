import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key, required this.textCheckBox});
  final String textCheckBox;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                icon: Icon(
                  isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                  color: Color(0xff8DC048),
                ),
              ),

              Text(widget.textCheckBox, textAlign: TextAlign.start),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

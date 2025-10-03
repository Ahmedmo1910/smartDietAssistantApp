import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.textCheckBox,
    required this.value,
    required this.onChanged,
  });

  final String textCheckBox;
  final bool value;
  final ValueChanged<bool> onChanged;

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
                onPressed: () => onChanged(!value),
                icon: Icon(
                  value ? Icons.check_box : Icons.check_box_outline_blank,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(textCheckBox, textAlign: TextAlign.start),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

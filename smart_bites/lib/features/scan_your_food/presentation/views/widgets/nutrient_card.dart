import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class NutrientCard extends StatelessWidget {
  final String label;
  final String value;
  final Widget? widget;
  final Color? color;
  const NutrientCard({
    super.key,
    required this.label,
    required this.value,
    this.widget,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTextStyles.semiBold16),

              widget ?? Icon(Icons.import_contacts),
            ],
          ),
          SizedBox(height: 12),
          Text(value, style: AppTextStyles.regular12),
        ],
      ),
    );
  }
}

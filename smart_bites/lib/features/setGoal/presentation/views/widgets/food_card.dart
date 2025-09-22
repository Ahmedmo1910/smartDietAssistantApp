import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class FoodCard extends StatelessWidget {
  final double kCal;
  final bool isAdded;
  final VoidCallback onAdd;
  const FoodCard({
    super.key,
    required this.kCal,
    required this.isAdded,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 364 / 150,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,

              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/omlet.jpg",
                  width: 118,
                  height: 116,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omelette",
                      style: AppTextStyles.semiBold16.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Omelette with vegetables, like other types of omelette",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular14.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Kcal : $kCal",
                      style: AppTextStyles.regular14.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

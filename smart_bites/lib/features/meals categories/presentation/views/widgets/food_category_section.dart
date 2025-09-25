import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/meals_description_screen.dart';

class FoodCategorySection extends StatelessWidget {
  final String imageUrl;
  final String nameOfTheMeals;
  final int numOfKcal;
  const FoodCategorySection({
    required this.imageUrl,
    required this.nameOfTheMeals,
    required this.numOfKcal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 40),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFDAECC5),
                border: Border.all(),
                borderRadius: BorderRadius.circular(16),
              ),
              width: MediaQuery.sizeOf(context).width * 0.55,
              height: MediaQuery.sizeOf(context).height * 0.35,
            ),
            Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'sdghsdhgkhdslkghlsdkhglksdhgklhsdkghsdlkhg',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.medium16.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      nameOfTheMeals,
                      style: AppTextStyles.semiBold18.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Kcal:',
                                  style: AppTextStyles.regular16.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' $numOfKcal',
                                  style: AppTextStyles.bold16.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MealsDescriptionScreen.routeName,
                            );
                          },
                          child: Text(
                            'show more...',
                            style: AppTextStyles.small14.copyWith(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: -40,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 95,
                child: ClipOval(child: Image.asset(imageUrl, fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

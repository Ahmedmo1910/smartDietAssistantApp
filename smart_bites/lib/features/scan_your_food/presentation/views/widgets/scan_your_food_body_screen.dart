import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/scan_your_food/presentation/cubit/meal_analysis_cubit.dart';
import 'package:smart_bites/features/scan_your_food/presentation/cubit/meal_analysis_state.dart';
import 'package:smart_bites/features/scan_your_food/presentation/views/widgets/image_container.dart';
import 'package:smart_bites/features/scan_your_food/presentation/views/widgets/nutrient_card.dart';

class ScanYourFoodBodyScreen extends StatelessWidget {
  const ScanYourFoodBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealAnalysisCubit, MealAnalysisState>(
      listener: (context, state) {
        if (state is MealAnalysisFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      state.image!,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  ImageContainer(),

                const SizedBox(height: 20),

                if (state is MealAnalysisLoading)
                  Lottie.asset("assets/animations/loading.json", height: 300),

                if (state is MealAnalysisSuccess) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.meal.meal, style: AppTextStyles.bold24),
                      const SizedBox(height: 16),
                      Align(
                        alignment: AlignmentGeometry.center,
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            NutrientCard(
                              label: "Calories",
                              value: "${state.meal.calories} \nkcal",
                              color: Color(0xFFFFF6E0),
                              widget: SvgPicture.asset(
                                'assets/icons/kcal.svg',
                                height: 25,
                                width: 25,
                              ),
                            ),
                        
                            NutrientCard(
                              label: "Protein",
                              value: "${state.meal.protein} \ngrams",
                              color: Color(0xFFEFF0FF),
                              widget: SvgPicture.asset(
                                'assets/icons/protein.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            NutrientCard(
                              label: "Carbs",
                              value: "${state.meal.carbs} \ngrams",
                              color: Color(0xFFDDFFDA),
                              widget: SvgPicture.asset('assets/icons/carbs.svg'),
                            ),
                            NutrientCard(
                              label: "Fat",
                              value: "${state.meal.fat} \ngrams",
                              color: Color(0xFFEEF7FF),
                              widget: SvgPicture.asset(
                                'assets/icons/fat.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text("Ingredients:", style: AppTextStyles.semiBold20),
                      const SizedBox(height: 8),
                      Text(
                        state.meal.ingredients.join("\n "),
                        style: AppTextStyles.regular16,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

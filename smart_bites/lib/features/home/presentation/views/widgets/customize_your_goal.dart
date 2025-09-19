import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_cubit.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';
import 'custom_text_field.dart';

class CustomizeYourGoal extends StatelessWidget {
  const CustomizeYourGoal({super.key});

  @override
  Widget build(BuildContext context) {
    final goalController = TextEditingController();
    final cupSizeController = TextEditingController();
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return BlocProvider.value(
              value: context.read<WaterCubit>(),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.white,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 280),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Customize Goal",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold20.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            controller: goalController,
                            hintText: 'Your Goal (L)',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 12),
                          CustomTextFormField(
                            controller: cupSizeController,
                            hintText: 'Cup Size (ml)',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),
                          MainButton(
                            width: 100,
                            height: 40,
                            text: 'Save',
                            hasCircularBorder: true,
                            onTap: () {
                              final goalLiters =
                                  double.tryParse(goalController.text) ?? 2.0;
                              final goalMl = (goalLiters * 1000).toInt();
                              final cupSize =
                                  int.tryParse(cupSizeController.text) ?? 200;

                              if (cupSize <= 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "cup size must be greater than 0.😊",
                                    ),
                                  ),
                                );
                                return;
                              }
                              context.read<WaterCubit>().updateGoalAndCup(
                                goalMl: goalMl,
                                cupSize: cupSize,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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

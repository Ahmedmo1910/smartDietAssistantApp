import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/scan_your_food/presentation/cubit/meal_analysis_cubit.dart';

class ScanFoodFab extends StatelessWidget {
  const ScanFoodFab({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      final cubit = context.read<MealAnalysisCubit>();
      cubit.analyzeMeal(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      iconTheme: const IconThemeData(color: Colors.white, size: 25),
      icon: Icons.qr_code_scanner,
      activeIcon: Icons.close,
      backgroundColor:AppColors.primaryColor,
      overlayOpacity: 0.3,
      overlayColor: AppColors.blackColor,
      spaceBetweenChildren: 8.0,
      children: [
        SpeedDialChild(
          labelStyle: AppTextStyles.regular12,
          child: const Icon(Icons.image),
          label: "Choose from gallery",
          onTap: () => _pickImage(context, ImageSource.gallery),
        ),
        SpeedDialChild(
          labelStyle: AppTextStyles.regular12,
          child: const Icon(Icons.camera_alt),
          label: "Take a photo",
          onTap: () => _pickImage(context, ImageSource.camera),
        ),
      ],
    );
  }
}

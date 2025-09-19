import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/presentation/cubits/profile_image/profile_image_cubit.dart';
import 'package:smart_bites/core/presentation/cubits/profile_image/profile_image_state.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

AppBar buildAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    titleSpacing: 3.0,
    title: Column(
      children: [
        Text('SmartBites', style: AppTextStyles.bold20),
        const SizedBox(height: 8),
        Text('Hello , User', style: AppTextStyles.medium16),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<ProfileCubit, ProfileImageState>(
          builder: (context, state) {
            String? imagePath;

            if (state is ProfileLoaded) {
              imagePath = state.profileImage;
            } else if (state is ProfileImageChanged) {
              imagePath = state.profileImage;
            }

            if (imagePath == null || imagePath.isEmpty) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Icon(
                  Icons.person,
                  size: 35,
                ),
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              );
            }
          },
        ),
      ),
    ],
  );
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/presentation/cubits/profile_image/profile_image_cubit.dart';
import 'package:smart_bites/core/presentation/cubits/profile_image/profile_image_state.dart';


class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileImageState>(
      builder: (context, state) {
        String? imagePath;

        if (state is ProfileLoaded) {
          imagePath = state.profileImage;
        } else if (state is ProfileImageChanged) {
          imagePath = state.profileImage;
        }

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: (imagePath == null || imagePath.isEmpty)
                  ? const Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    )
                  : Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => context.read<ProfileCubit>().changeProfileImage(),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

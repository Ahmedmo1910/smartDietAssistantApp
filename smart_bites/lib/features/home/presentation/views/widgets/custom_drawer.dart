import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/utils/app_colors.dart';

import 'package:smart_bites/features/home/presentation/AppCubit/app_cubit.dart';

import 'custom_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.watch<AppCubit>();

        return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  'Mohamed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                accountEmail: const Text('Mohamed@gmail.com'),
                currentAccountPicture: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: cubit.profileImage.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.white,
                            )
                          : Image.file(
                              File(cubit.profileImage),
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => cubit.changeProfileImage(),
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
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.lightPrimaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                otherAccountsPictures: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => cubit.changeMode(),
                    icon: Icon(
                      cubit.isDark ? Icons.nights_stay : Icons.wb_sunny,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    CustomListTile(
                      text: 'Home',
                      icon: Icons.home,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    CustomListTile(
                      text: 'Settings',
                      icon: Icons.settings,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    CustomListTile(
                      text: 'Favorites',
                      icon: Icons.favorite,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    CustomListTile(
                      text: 'Share',
                      icon: Icons.share,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('LogOut'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

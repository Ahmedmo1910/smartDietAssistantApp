import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_list_tile.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/profile_image.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/theme_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'User Name',
              style: AppTextStyles.semiBold18.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              'userName@gmail.com',
              style: AppTextStyles.regular14.copyWith(color: Colors.white),
            ),
            currentAccountPicture: const ProfileImage(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            otherAccountsPictures: const [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications, size: 25, color: Colors.white),
              ),
              ThemeButton(),
            ],
          ),
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
          MainButton(
            hasCircularBorder: true,
            width: MediaQuery.sizeOf(context).width / 2,
            height: 45,
            text: 'Log Out',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

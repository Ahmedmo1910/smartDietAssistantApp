import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_home_widget.dart';

List<CustomHomeWidget> getHomeWidget = [
  CustomHomeWidget(
    text: 'Track your daily calorie',
    widget: Image.asset('assets/images/kcal.png', fit: BoxFit.contain,isAntiAlias: true,),
    button: MainButton(
      hasCircularBorder: true,
      width: 110,
      height: 35,
      text: 'Set Goal',
      onTap: () {},
    ),
  ),
  CustomHomeWidget(
    text: 'Log your daily exercise',
    widget: SvgPicture.asset('assets/images/workout.svg', fit: BoxFit.contain),
    button: MainButton(
      hasCircularBorder: true,
      width: 110,
      height: 35,
      text: 'Exercise',
      onTap: () {},
    ),
  ),
  CustomHomeWidget(
    text: 'Track your daily meals',
    widget: SvgPicture.asset('assets/images/chef.svg', fit: BoxFit.contain),
    button: MainButton(
      hasCircularBorder: true,
      width: 110,
      height: 35,
      text: 'Meals',
      onTap: () {},
    ),
  ),
  CustomHomeWidget(
    text: 'Scan your food quickly',
    widget: Icon(Icons.qr_code_scanner, size: 50,),
    button: MainButton(
      hasCircularBorder: true,
      width: 111,
      height: 35,
      text: 'Start scan',
      onTap: () {},
    ),
  ),
];

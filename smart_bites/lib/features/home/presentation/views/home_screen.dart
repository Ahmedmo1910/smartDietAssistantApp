import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_cubit.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_state.dart';
import 'package:smart_bites/features/home/services/water_storage.dart';
import 'widgets/build_app_bar_widget.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WaterCubit(getIt<WaterStorage>()),
      child: BlocListener<WaterCubit, WaterState>(
        listener: (context, state) {
          if (state.currentMl == state.goalMl && state.goalMl != 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Congratulations! You have reached your daily water intake goal of ${(state.goalMl / 1000).toInt()} liters.🎉',
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: buildAppBarWidget(),
          body: SafeArea(child: HomeScreenBody()),
        ),
      ),
    );
  }
}

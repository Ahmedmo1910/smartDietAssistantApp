import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_cubit.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_state.dart';
import 'cup_widget.dart';
import 'customize_your_goal.dart';

class WaterWidget extends StatelessWidget {
  const WaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterCubit, WaterState>(
      builder: (context, state) {
        final totalCups = state.totalCups; // +1 for the add button
        final filledCups = state.filledCups;
        return Container(
          width: MediaQuery.sizeOf(context).width * 0.95,
          height: MediaQuery.sizeOf(context).height * 0.201,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.lightPrimaryColor],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                minTileHeight: 0,
                title: Text(
                  'Water',
                  style: AppTextStyles.semiBold20.copyWith(color: Colors.white),
                ),
                trailing: CustomizeYourGoal(),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Stay hydrate by drink at least 2 liters a day ',
                    style: AppTextStyles.regular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.055,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalCups,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    bool isFilled = index < filledCups;
                    bool isAddButton = index == filledCups;
                    return GestureDetector(
                      onTap: () {
                        if (isAddButton) {
                          context.read<WaterCubit>().addCup();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.015,
                        ),
                        child: CupWidget(
                          filled: isFilled,
                          addButton: isAddButton,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
                child: Text(
                  "${state.currentMl} / ${state.goalMl} ml",
                  style: AppTextStyles.regular12.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/presentation/cubits/theme/theme_cubit.dart';
import 'package:smart_bites/core/presentation/cubits/theme/theme_state.dart';


class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final cubit = context.watch<ThemeCubit>();
        return IconButton(
          onPressed: () => cubit.toggleTheme(),
          icon: Icon(
            cubit.isDark ? Icons.nights_stay : Icons.wb_sunny,
            size: 25,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
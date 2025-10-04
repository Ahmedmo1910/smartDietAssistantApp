import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/build_error_bar.dart';
import 'package:smart_bites/features/auth/signin/presentation/cubit/signin_cubit.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/custom_progress_hud.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/show_custom_dialog.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/sign_in_screen_body.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/verification_screen.dart';
import 'package:smart_bites/main_screen.dart';

class SigninScreenBlocConsumer extends StatelessWidget {
  const SigninScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            showCustomDialog(
              context,
              titleText: 'Login Successful! 🎉',
              description:
                  'You are now logged in to your account. Enjoy your experience!',
              animationPath: 'assets/animation/animation_success.json',
              routeName: MainScreen.routeName,
            );
          } else if (state is SigninFailure) {
            buildErrorBar(context, state.message);
          } else if (state is SigninEmailNotVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Your email is not verified yet. Please verify your email.',
                ),
                duration: Duration(seconds: 3),
              ),
            );

            Navigator.pushReplacementNamed(
              context,
              VerificationScreen.routeName,
            );
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
            isLoading: state is SigninLoading,
            child: const SignInScreenBody(),
          );
        },
      ),
    );
  }
}

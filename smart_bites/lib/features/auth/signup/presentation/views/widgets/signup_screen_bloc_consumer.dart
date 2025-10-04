import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/build_error_bar.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/custom_progress_hud.dart';
import 'package:smart_bites/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:smart_bites/features/auth/verification/presentation/view/verification_screen.dart';

class SignupScreenBlocConsumer extends StatelessWidget {
  const SignupScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushReplacementNamed(
              context,
              VerificationScreen.routeName,
            );
          }
          if (state is SignupFailure) {
            buildErrorBar(context, state.message);
          }
        },
        builder: (context, state) {
          return CustomProgressHud(
            isLoading: state is SignupLoading ? true : false,
            child: SignUpScreenBody(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';
import 'package:smart_bites/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/widgets/signup_screen_bloc_consumer.dart';


class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signUpScreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>(),),
      child: Scaffold(
        body: SafeArea(
          child: SignupScreenBlocConsumer(),
        ),
      ),
    );
  }
}

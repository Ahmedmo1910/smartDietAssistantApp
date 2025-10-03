import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';
import 'package:smart_bites/features/auth/signin/presentation/cubit/signin_cubit.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/signin_screen_bloc_consumer.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'SignInScreen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(body: SafeArea(child: SigninScreenBlocConsumer())),
    );
  }
}

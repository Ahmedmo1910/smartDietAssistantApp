import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/or_row_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/social_row_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_bottom_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_form_password.dart';
import 'package:smart_bites/features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/widgets/check_box_widget.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/widgets/text_form_name.dart';
import 'package:smart_bites/features/validation/validation_password.dart';
import 'package:smart_bites/main_screen.dart';
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password;

  bool hiddenPassword = false;
  bool hiddenConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderWidget(
              headerTitle: 'Create your new\naccount.',
              headerSubTitle: 'Please, sign up to continue.',
            ),
            Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  TextFormName(
                    onSaved: (value) => userName = value!,
                    textName: 'Full Name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 15),
                  TextFormEmail(
                    onSaved: (value) => email = value!,
                    textEmail: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(height: 15),
                  // Password
                  TextFormPassword(
                    onSaved: (value) => password = value!,
                    hiddenPassword: hiddenPassword,
                    textPassword: 'Password',
                    onToggle: () {
                      setState(() {
                        hiddenPassword = !hiddenPassword;
                      });
                    },
                    validator: validationPasswordMethod(),
                  ),
                  const SizedBox(height: 15),
                  // Confirm Password
                  TextFormPassword(
                    hiddenPassword: hiddenConfirmPassword,
                    textPassword: 'Confirm Password',
                    onToggle: () {
                      setState(() {
                        hiddenConfirmPassword = !hiddenConfirmPassword;
                      });
                    },
                  ),
                  CheckBoxWidget(textCheckBox: 'I Agree with privacy policy.'),
                  ElevatedBottomWidget(
                    formKey: _formKey,
                    textBottom: 'Sign Up',
                    routeName: MainScreen.routeName,
                    onSuccess: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //! implement signup cubit here☺
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  OrRowWidget(textOr: 'Sign Up'),
                  const SizedBox(height: 15),
                  SocialRowWidget(
                    googleSign: () =>
                        context.read<SignupCubit>().signinWithGoogle(),
                    facebookSign: () =>
                        context.read<SignupCubit>().signinWithFacebook(),
                  ),
                ],
              ),
            ),
            TextBottomWidget(
              routeName: SignInScreen.routeName,
              textStatic: 'Already have an account ?',
              textBottom: 'Sign in',
              isPop: true,
            ),
          ],
        ),
      ),
    );
  }
}

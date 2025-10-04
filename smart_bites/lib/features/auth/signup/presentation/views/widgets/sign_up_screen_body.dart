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
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';


class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email;
  String password = '';
  String confirmPassword = '';
  bool hiddenPassword = false;
  bool hiddenConfirmPassword = false;
  bool isPolicyAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            //Header ........)
            AuthHeaderWidget(
              headerTitle: 'Create your new\naccount.',
              headerSubTitle: 'Please, sign up to continue.',
            ),
            //Form ........)
            Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  //Text Input name ........)
                  TextFormName(
                    onSaved: (value) => userName = value!,
                    textName: 'Full Name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 15),
                  //Text Input email ........)
                  TextFormEmail(
                    onSaved: (value) => email = value!,
                    textEmail: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(height: 15),
                  //Text Input password ........)
                  TextFormPassword(
                    onSaved: (value) => password = value!,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
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
                  //Text Input Confirm Password ........)
                  TextFormPassword(
                    onSaved: (value) => confirmPassword = value!,
                    onChanged: (value) {
                      setState(() => confirmPassword = value);
                    },
                    hiddenPassword: hiddenConfirmPassword,
                    textPassword: 'Confirm Password',
                    onToggle: () {
                      setState(() {
                        hiddenConfirmPassword = !hiddenConfirmPassword;
                      });
                    },

                    validator: validationConfirmPasswordMethod(password),
                  ),

                  const SizedBox(height: 15),
                  //check box ........)
                  CheckBoxWidget(
                    textCheckBox: 'I Agree with privacy policy.',
                    value: isPolicyAgreed,
                    onChanged: (value) {
                      setState(() => isPolicyAgreed = value);
                    },
                  ),
                  const SizedBox(height: 15),
                  //Sign up Botton ........)
                  ElevatedBottomWedgit(

                    formKey: _formKey,
                    textBottom: 'Sign Up',
                    onSuccess: () {
                      if (!isPolicyAgreed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'You must agree with the privacy policy',
                            ),
                          ),
                        );
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              userName,
                            );
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

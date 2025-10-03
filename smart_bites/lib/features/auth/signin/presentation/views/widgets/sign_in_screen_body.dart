import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:smart_bites/features/auth/signin/presentation/cubit/signin_cubit.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/or_row_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/social_row_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_bottom_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_form_password.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/sign_up_screen.dart';
import 'package:smart_bites/main_screen.dart';
import 'package:smart_bites/widgets/elevated_botton_widget.dart';


class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hiddenPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header screen ........)
            AuthHeaderWidget(
              headerTitle: 'Sign In to your \naccount.',
              headerSubTitle: 'Please, sign in to continue.',
            ),
            //Form ........)
            Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  TextFormEmail(
                    onSaved: (value) => email = value!,
                    textEmail: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(height: 30),
                  TextFormPassword(
                    onSaved: (value) => password = value!,
                    hiddenPassword: hiddenPassword,
                    textPassword: 'Password', 

                    onToggle: () {
                      setState(() {
                        hiddenPassword = !hiddenPassword;
                      });
                    },
                  ),
                  const SizedBox(height: 50),

                  //Sign In Bottom ..................:)
                  ElevatedBottomWedgit(
                    formKey: _formKey,
                    textBottom: 'Sign In',
                    routeName: MainScreen.routeName,
                    onSuccess: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<SigninCubit>().signin(email, password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  //Or Row Widget ........)
                  OrRowWidget(textOr: 'Sign In'),
                  const SizedBox(height: 30),
                  //Social Row Widget ........)
                  SocialRowWidget(),
                ],
              ),
            ),
            SizedBox(height: 15),
            //Text Bottom Widget ........)
            TextBottomWidget(
              textStatic: 'Don’t have an account?',
              textBottom: 'Sign Up',
              routeName: SignUpScreen.routeName,
            ),
            //Text Forget Bottom ........)
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  'Forget Password',
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

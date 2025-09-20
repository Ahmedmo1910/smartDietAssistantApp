import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/home_screen.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/or_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/social_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_bottom_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_password.dart';
import 'package:smart_bites/features/signup/presentation/views/widgets/check_box_widget.dart';
import 'package:smart_bites/features/signup/presentation/views/widgets/text_form_name.dart';
import 'package:smart_bites/features/validation/validation_password.dart';
import 'package:smart_bites/widgets/elevated_botton_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'SignUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hiddenPassword = false;
  bool hiddenConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                child: Column(
                  children: [
                    TextFormName(
                      textName: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),
                    TextFormEmail(
                      textEmail: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 15),
                    // Password
                    TextFormPassword(
                      hiddenPassword: hiddenPassword,
                      textPassword: 'Password',
                      onToggle: () {
                        setState(() {
                          hiddenPassword = !hiddenPassword;
                        });
                      },
                      validator: validationPasswordMethod(),
                      onChanged: (value) {
                        _password = value;
                      },
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
                      validator: validationConfirmPasswordMethod(_password),
                    ),
                    CheckBoxWidget(
                      textCheckBox: 'I Agree with privacy policy.',
                    ),
                    ElevatedBottonWedgit(
                      formKey: _formKey,
                      textBottom: 'Sign Up',
                      routeName: HomeScreen.routeName,
                      onSuccess: () {},
                    ),
                    const SizedBox(height: 15),
                    OrRowWidget(textOr: 'Sign Up'),
                    const SizedBox(height: 15),
                    SocialRowWidget(),
                  ],
                ),
              ),
              TextBottomWidget(
                routeName: SignUpScreen.routeName,
                textStatic: 'Already have an account ?',
                textBottom: 'Sign in',
                isPop: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

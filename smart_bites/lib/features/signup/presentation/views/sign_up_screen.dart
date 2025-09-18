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
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const  String routeSignIn='SignIn';
    static const String routeName = 'SignUpScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                      nameController: nameController,
                      textName: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),
                    TextFormEmail(
                      emailController: emailController,
                      textEmail: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 15),
                    // Password
                    TextFormPassword(
                      passwordController: passwordController,
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
                      passwordController: confirmPasswordController,
                      hiddenPassword: hiddenConfirmPassword,
                      textPassword: 'Confirm Password',
                      onToggle: () {
                        setState(() {
                          hiddenConfirmPassword = !hiddenConfirmPassword;
                        });
                      },
                      validator: validationConfirmPasswordMethod(
                        passwordController,
                      ),
                    ),
                    CheckBoxWidget(
                      textCheckBox: 'I Agree with privacy policy.',
                    ),
                    ElevatedBottomWedgit(
                      formKey: _formKey,
                      textBottom: 'Sign Up',
                      routeName: HomeScreen.routeName,
                       onSuccess: () {
                        emailController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        nameController.clear();
                      },
                    ),
                    const SizedBox(height: 15),
                    OrRowWidget(textOr: 'Sign Up'),
                    const SizedBox(height: 15),
                    SocialRowWidget(),
                  ],
                ),
              ),
              TextBottomWidget(
                routeName:SignUpScreen.routeSignIn ,
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


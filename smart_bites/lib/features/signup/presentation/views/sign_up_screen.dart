import 'package:flutter/material.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/or_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/social_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_bottom_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_password.dart';
import 'package:smart_bites/features/signup/presentation/views/widgets/check_box_widget.dart';
import 'package:smart_bites/features/signup/presentation/views/widgets/text_form_name.dart';
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class SignUpScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header screen.................:)
              AuthHeaderWidget(
                headerTitle: 'Create your new\naccount.',
                headerSubTitle: 'Please, sign up to continue.',
              ),
              //Form .................:)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormName(
                      nameController: nameController,
                      textName: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),
                    TextFormEmail(
                      emailController: emailController,
                      textEmail: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 15),
                    TextFormPassword(
                      passwordController: passwordController,
                      hiddenPassword: hiddenPassword,
                      textPassword: 'Password',
                      onToggle: () {
                        setState(() {
                          hiddenPassword = !hiddenPassword;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormPassword(
                      passwordController: confirmPasswordController,
                      hiddenPassword: hiddenPassword,
                      textPassword: 'Confirm Password',
                      onToggle: () {
                        setState(() {
                          hiddenPassword = !hiddenPassword;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ('Confirm password is required');
                        }
                        if (value != passwordController.text) {
                          return "Password does'nt match";
                        }
                        return null;
                      },
                    ),
                    // Chech Box Widget ............ :)
                    CheckBoxWidget(
                      textCheckBox: 'I Agree with privacy policy.',
                    ),
                    //Sign Up Bottom ..................:)
                    ElevatedBottomWedgit(
                      formKey: _formKey,
                      textBottom: 'Sign Up',
                      // destination: HomeScreen(),
                    ),
                    const SizedBox(height: 15),
                    //Or Row Widget..............:)
                    OrRowWidget(textOr: 'Sign Up'),
                    const SizedBox(height: 15),

                    //Social Row Widget..............:)
                    SocialRowWidget(),
                  ],
                ),
              ),
              //Text Bottom Widget .................:)
              TextBottomWidget(
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

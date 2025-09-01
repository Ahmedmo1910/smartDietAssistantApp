import 'package:flutter/material.dart';
import 'package:smart_bites/features/forgetpassword/persentation/views/forget_password_screen.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/or_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/social_row_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_bottom_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_password.dart';
import 'package:smart_bites/features/signup/presentation/views/sign_up_screen.dart';
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                headerTitle: 'Sign In to your \naccount.',
                headerSubTitle: 'Please, sign in to continue.',
              ),
              //Form ......................:)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormEmail(
                      emailController: emailController,
                      textEmail: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 50),
                    //Sign In Bottom ..................:)
                    ElevatedBottomWedgit(
                      formKey: _formKey,
                      textBottom: 'Sign In',
                    ),
                    // ),
                    const SizedBox(height: 30),
                    //Or Row Widget..............:)
                    OrRowWidget(textOr: 'Sign In'),
                    const SizedBox(height: 30),
                    //Social Row Widget..............:)
                    SocialRowWidget(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              //Text Bottom Widget .................:)
              TextBottomWidget(
                textStatic: 'Don’t have an account?',
                textBottom: 'Sign Up',
                destination: SignUpScreen(),
              ),
              //Text Forget Bottom ..................:)
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

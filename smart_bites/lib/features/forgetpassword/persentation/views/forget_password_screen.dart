import 'package:flutter/material.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              //Header Screen .............:)
              AuthHeaderWidget(
                headerTitle: 'Forget Password ?',
                headerSubTitle:
                    "Enter your email address and\nwe’ll send a confirmation code",
              ),
              //Form .............:)
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: TextFormEmail(
                  emailController: emailController,
                  textEmail: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 70),
              //Continue Bottom ..................:)
              ElevatedBottomWedgit(formKey: _formKey, textBottom: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/widgets/elevated_botton_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgetPasswordScreen';

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
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  // emailController: emailController,
                  textEmail: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 40),
              //Continue Bottom ..................:)
              ElevatedBottonWedgit(formKey: _formKey, textBottom: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}

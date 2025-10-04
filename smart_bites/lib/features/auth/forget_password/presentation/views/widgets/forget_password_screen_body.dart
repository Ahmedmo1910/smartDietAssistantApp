import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/auth_header_widget.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/widgets/text_form_email.dart';
import 'package:smart_bites/widgets/elevated_bottom_widget.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                textEmail: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 40),
            //Continue Bottom ..................:)

            ElevatedBottomWedgit(formKey: _formKey, textBottom: 'Continue'),
          ],
        ),
      ),
    );
  }
}

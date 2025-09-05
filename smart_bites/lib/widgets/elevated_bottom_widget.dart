import 'package:flutter/material.dart';

class ElevatedBottomWedgit extends StatelessWidget {
  final String textBottom;
  final Widget? destination;
  final GlobalKey<FormState>? formKey;
  final bool showDialogOnSuccess;

  const ElevatedBottomWedgit({
    super.key,
    required this.textBottom,
    this.destination,
    this.formKey,
    this.showDialogOnSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
        width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff8DC048)),
        onPressed: () {
          if (formKey == null || formKey!.currentState!.validate()) {
            if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination!),
              );
            }
            formKey?.currentState!.save();
            formKey?.currentState!.reset();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            textBottom,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

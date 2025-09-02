import 'package:flutter/material.dart';

class SocialRowWidget extends StatelessWidget {
  const SocialRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 128, 128, 128),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/google.png'),
              ),
            ),
          ),
        ),

        CircleAvatar(
          // radius: 32,
          radius: 25,
          backgroundColor: const Color.fromARGB(255, 128, 128, 128),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/facebook.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 128, 128, 128),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/mac.jpg'),
              ),
            ),
          ),
        ),

        // Expanded(child: Divider()),
      ],
    );
  }
}

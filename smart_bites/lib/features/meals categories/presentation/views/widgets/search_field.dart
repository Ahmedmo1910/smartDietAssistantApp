import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchField extends StatelessWidget {
  const searchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      width: 360,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(Icons.search, size: 30, color: Colors.grey),
        ),
      ),
    );
  }
}
